package com.dabom.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dabom.common.Util;
import com.dabom.dto.VideoComment;
import com.dabom.dto.VideoUpload;
import com.dabom.service.VideoUploadService;
import com.dabom.ui.ThePager;

@Controller
@RequestMapping(path = { "/video" })
public class VideoUploadController {

	@Autowired	// 자동 주입 명령어.. 이거 없으면 null된다
	@Qualifier("videoUploadService")
	private VideoUploadService videoUploadService;

	@GetMapping(path = { "/uploadList" })
	public String uploadList(String memberId, @RequestParam(defaultValue = "1" ) int uPageNo, Model model) {
		
		int uPageSize = 30;
		int uPagerSize = 10;
		int uCount = 0;

//		List<VideoUpload> vUploadList = videoUploadService.findAll();
		List<VideoUpload> vUploadList = videoUploadService.findByUploadPage(uPageNo, uPageSize);
		
		ThePager uPager = new ThePager(uCount, uPageNo, uPageSize, uPagerSize, memberId);
//		
		model.addAttribute("vUploadList", vUploadList);
		model.addAttribute("uPager", uPager);	// , 없는거 못보냐 정신 안차려?
		model.addAttribute("uPageNo", uPageNo);

		return "video/uploadList";

	}

	@GetMapping(path = { "/upload" })
	public String showUploadForm() {

		return "video/upload"; // -->/WEB-INF/views/ + video/upload + .jsp

	}

	@PostMapping(path = { "/upload" }) // 야 신난다 하나도 생각이 안나ㅋㅋㅋㅋ 이보다 더 나빠질 수가 있을까 %(@$*@^&
	public String upload(VideoUpload vUpload, // VideoUpload dto에서 데이터 가져오고
			MultipartFile video, // MultipartFile로 첨부파일 가져오고
			MultipartFile thumbnail, HttpServletRequest req) { // HttpServletRequest으로 HttpServletRequest 객체로 데이터 들여보냄

		// getRealPath : 웹경로 -> 컴퓨터 경로
		// http:// .... /a/b/c ---> C:\...\a\b\c
		String uploadDir = req.getServletContext() // 해당 ServletRequest가 마지막으로 전달된 서블릿 컨텍스트를 가져옵니다... 뭔 뜻이야 이거
				.getRealPath("resources/upload-files"); // resource에 upload-files폴더+하위항목에 web.xml 추가하고

		String videoFileName = video.getOriginalFilename(); // 동영상 파일 이름 가져와
		String thumbnailFileName = thumbnail.getOriginalFilename();	// 썸네일 파일 이름 가져와
		if (videoFileName != null && videoFileName.length() > 0 && thumbnailFileName != null
				&& thumbnailFileName.length() > 0) { // videoFileName이 null이 아니고, videoFileName의 길이가 0 이상이면(=첨부파일이 있으면)

			String videoSavedName = Util.makeUniqueFileName(videoFileName); // 고유 파일 이름을 만드는 메서드(common/Util에서
																			// makeUniqueFileName 참조)에 videoFileName를
																			// 대입한 결과물은 savedFileName
			vUpload.setVideoFileName(videoFileName); // f의 vedioFileName을 호출
			vUpload.setVideoSavedName(videoSavedName); // f의 videoSavedName을 호출
			String thumbnailSavedName = Util.makeUniqueFileName(thumbnailFileName); // 고유 파일 이름을 만드는 메서드(common/Util에서
																					// makeUniqueFileName 참조)에
																					// videoFileName를 대입한 결과물은
																					// savedFileName
			vUpload.setThumbnailFileName(thumbnailFileName);
			vUpload.setThumbnailSavedName(thumbnailSavedName);

			try {
				File path = new File(uploadDir, videoSavedName);
				video.transferTo(path); // 파일 저장
				path = new File(uploadDir, thumbnailSavedName);
				thumbnail.transferTo(path); // 파일 저장

			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:upload";// 여기서는 없으면 글을 못쓰게 설정해야 함
			}
		} else {
			System.out.println("동영상 첨부는 필수입니다");
			return "redirect:upload";// 여기서는 없으면 글을 못쓰게 설정해야 함
		}

		videoUploadService.uploadVideo(vUpload);
//		System.out.println(vUpload);

		return "redirect:uploadList";

	}

	@GetMapping(path = { "/list" })
	public String List(String memberId, @RequestParam(defaultValue = "1") int pageNo, Model model) {
		
		int pageSize = 30;
		int pagerSize = 10;
		int count = 0;
		
//		List<VideoUpload> vList = videoUploadService.viewerFindAll();
		List<VideoUpload> vList = videoUploadService.findByPage(pageNo, pageSize);

		ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, memberId);
		
		model.addAttribute("vList", vList);
		model.addAttribute("pager", pager);
		model.addAttribute("pageNo", pageNo);

		return "video/list";

	}

	@GetMapping(path = { "/detail" })
	public String detail(@RequestParam(name="videoNo", defaultValue = "-1") int videoNo,
						@RequestParam(name = "pageNo", defaultValue = "-1") int pageNo, Model model) {
		if(videoNo < 1 && pageNo < 1) {
			return "redirect:list";
		}
		
		VideoUpload vUpload = videoUploadService.findByVideoNo(videoNo);
		if(vUpload == null) {
			return "redirect:list";
		}
		
		model.addAttribute("vUpload", vUpload);
		model.addAttribute("pageNo", pageNo);
		
		return "video/detail";

	}

	@GetMapping(path = { "/delete" })
	public String delete(@RequestParam(name = "videoNo", defaultValue = "-1") int videoNo) {
		
		if(videoNo > 0) {
			videoUploadService.delete(videoNo);
		}
		
		return "redirect:uploadList";

	}
	
	@GetMapping(path = {"/deleteChecked"})
	public String checkDelete(@RequestParam(name = "videoNos", defaultValue = "-1") String videoNos) {
		//int[]도 안돼... 자료형 리스트로 바꿔도 안돼... form 태그는 tbody에 들어가지도 않아... 내가 대체 널 어쩌면 좋겠니
		String[] videoNoList = videoNos.split(",");
		for (String videoNo : videoNoList) {	// videoNo = 0; videoNo<=videoNos; videoNo++ 기억하지? 그냥 모든 게시글 번호라고 생각해 그렇게 반복문 돌려야지
			videoUploadService.delete(Integer.parseInt(videoNo));
		}
		
		return "redirect:uploadList";
		
	}

	@GetMapping(path = { "/update" })
	public String showEditForm(@RequestParam(name = "videoNo", defaultValue = "-1") int videoNo,
							@RequestParam(name = "uPageNo", defaultValue = "-1") int uPageNo, Model model) {
		
		if(videoNo < 1 && uPageNo < 1) {	// 동영상 게시글이 없을 때(게시글 번호가 1보다 작을 때)
			return "redirect:uploadList";	// 직접적인 리다이렉트 주소보다는 그냥 뒤로가기 기능만 하고 싶은데...
		}
		
		VideoUpload vUpload = videoUploadService.findByVideoNo(videoNo);
		if(vUpload == null) {
			return "redirect:uploadList";
		}
		
		model.addAttribute("vUpload", vUpload);
		model.addAttribute("uPageNo", uPageNo);
		
		return "video/update";

	}

	@PostMapping(path = { "/update" })
	public String edit(VideoUpload vUpload, MultipartFile video, MultipartFile thumbnail, HttpServletRequest req) {
		
		int videoNo = vUpload.getVideoNo();	// 전체를 다 불러와라?\
//		String originalVideoFile = vUpload.getVideoFileName();	// 이런식으로 불러오는건 아닌거같은데...
		
		VideoUpload vUploadCurrent = videoUploadService.findByVideoNo(videoNo);	// 여기에 힌트가 있다고 했지...
		if(vUploadCurrent == null) {				// 일단 이 구문은 아예 필요없고
			return "redirect:list";			// 이것도 필요없고...
		}

		String uploadDir = req.getServletContext().getRealPath("/resources/upload-files");
		String videoFileName = video.getOriginalFilename(); // 파일 이름 가져와
		String thumbnailFileName = thumbnail.getOriginalFilename();
		
		
		//videoNo로 UploadVideo 조회 -> videoSavedName, thumbnailSavedName 읽기
		   
		
		if (videoFileName != null && videoFileName.length() > 0) {
			File vFile = new File(uploadDir, vUploadCurrent.getVideoSavedName());        
	    	if( vFile.exists() ){
	    		vFile.delete();
	    	}
	    	String videoSavedName = Util.makeUniqueFileName(videoFileName);	// 고유 파일 이름을 만드는 메서드(common/Util에서
			// makeUniqueFileName 참조)에 videoFileName를
			// 대입한 결과물은 savedFileName
			vUpload.setVideoFileName(videoFileName);
			vUpload.setVideoSavedName(videoSavedName);
			try {
				File alter = new File(uploadDir, videoSavedName);
				video.transferTo(alter); // 파일 저장
			} catch (Exception e) {
				e.printStackTrace();				
			}
		} else {
			vUpload.setVideoFileName(vUploadCurrent.getVideoFileName());
			vUpload.setVideoSavedName(vUploadCurrent.getVideoSavedName());
		}
		if (thumbnailFileName != null && thumbnailFileName.length() > 0) {
	    	File tFile = new File(uploadDir, vUploadCurrent.getThumbnailSavedName());        
	    	if( tFile.exists() ){
	    		if(tFile.delete())tFile.delete();
	    	}
	    	String thumbnailSavedName = Util.makeUniqueFileName(thumbnailFileName); // 고유 파일 이름을 만드는 메서드(common/Util에서
						// makeUniqueFileName 참조)에
						// videoFileName를 대입한 결과물은
						// savedFileName
			vUpload.setThumbnailFileName(thumbnailFileName);
			vUpload.setThumbnailSavedName(thumbnailSavedName);
			
			try {
				File alter = new File(uploadDir, thumbnailSavedName);
				thumbnail.transferTo(alter); // 파일 저장
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			vUpload.setThumbnailFileName(vUploadCurrent.getThumbnailFileName());
			vUpload.setThumbnailSavedName(vUploadCurrent.getThumbnailSavedName());
		}
    	////////////////////////////////////
		
		videoUploadService.update(vUpload);
		
		return "redirect:uploadList";

	}
	
	@PostMapping(path = {"/videoComment-write"}, produces = {"text/plain;charset=utf-8"})
	@ResponseBody
	public String writeVideoComment(VideoComment vComment) {
		videoUploadService.writeVideoComment(vComment);
		
		return "success";
	}

	@GetMapping(path = {"/videoComment-list"})
	public String listVideoComment(@RequestParam(name="videoNo") int videoNo, Model model) {
		List<VideoComment>vComments = videoUploadService.findVideoCommentsByVideoNo(videoNo);
		
		model.addAttribute("vComments", vComments);
		
		return "video/comments";
		
	}
	
	@GetMapping(path = {"/videoComment-delete"}, produces = {"text/plain; charset=utf-8"})
	@ResponseBody
	public String deleteVideoComment(@RequestParam(name = "vCommentNo") int vCommentNo) {
		videoUploadService.deleteVideoComment(vCommentNo);
		
		return "success";
		
	}
	
	@PostMapping(path = {"/videoComment-update"}, produces = {"text/plain; charset=utf-8"})
	@ResponseBody
	public String updateVideoComment(VideoComment vComment) {
		videoUploadService.updateVideoComment(vComment);
		
		return "success";
	}
	
//	@PostMapping(path = {"videoRecomment-write"}, produces = {"text/plain;charset=utf-8"})
//	@ResponseBody
//	public String WriteVideoReComment(VideoComment vComment) {
//		
//		videoUploadService.writeVideoReComment(vComment);
//		
//		return "success";
//		
//	}
}
