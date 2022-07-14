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
import org.springframework.web.multipart.MultipartFile;

import com.dabom.common.Util;
import com.dabom.dto.VideoUpload;
import com.dabom.service.VideoUploadService;

@Controller
@RequestMapping(path = { "/video" })
public class VideoUploadController {

	@Autowired	// 자동 주입 명령어.. 이거 없으면 null된다
	@Qualifier("videoUploadService")
	private VideoUploadService videoUploadService;

	@GetMapping(path = { "/uploadList" })
	public String uploadList(Model model) {

		List<VideoUpload> vUploadList = videoUploadService.findAll();

		model.addAttribute("vUploadList", vUploadList);

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
	public String List(Model model) {
		
		List<VideoUpload> vList = videoUploadService.viewerFindAll();

		model.addAttribute("vList", vList);

		return "video/list";

	}

	@GetMapping(path = { "/detail" })
	public String detail(@RequestParam(name="videoNo", defaultValue = "-1") int videoNo, Model model) {
		if(videoNo == -1) {
			return "redirect:list";
		}
		
		VideoUpload vUpload = videoUploadService.findByVideoNo(videoNo);
		if(vUpload == null) {
			return "redirect:list";
		}
		
		model.addAttribute("vUpload", vUpload);
		
		return "video/detail";

	}

	@GetMapping(path = { "/delete" })
	public String delete(@RequestParam(name = "videoNo", defaultValue = "-1") int videoNo) {
		
		if(videoNo > 0) {
			videoUploadService.delete(videoNo);
		}
		
		return "redirect:uploadList";

	}
	
	@GetMapping(path = {})
	public String checkDelete(@RequestParam(name = "videoNo", defaultValue = "-1") int[] videoNos) {
		
		for (int videoNo : videoNos) {	// videoNo = 0; videoNo<=videoNos; videoNo++ 기억하지? 그냥 모든 게시글 번호라고 생각해 그렇게 반복문 돌려야지
			videoUploadService.delete(videoNo);
		}
		
		return "redirect:uploadList";
		
	}

	@GetMapping(path = { "/update" })
	public String showEditForm(@RequestParam(name = "videoNo", defaultValue = "-1") int videoNo, Model model) {
		
		if(videoNo < 1) {	// 동영상 게시글이 없을 때(게시글 번호가 1보다 작을 때)
			return "redirect:uploadList";	// 직접적인 리다이렉트 주소보다는 그냥 뒤로가기 기능만 하고 싶은데...
		}
		
		VideoUpload vUpload = videoUploadService.findByVideoNo(videoNo);
		if(vUpload == null) {
			return "redirect:uploadList";
		}
		
		model.addAttribute("vUpload", vUpload);
		
		return "video/update";

	}

	@PostMapping(path = { "/update" })
	public String edit(VideoUpload vUpload, MultipartFile video, MultipartFile thumbnail, HttpServletRequest req) {
		
		int videoNo = vUpload.getVideoNo();
		//videoNo로 UploadVideo 조회 -> videoSavedName, thumbnailSavedName 읽기
		    	
		String path = req.getServletContext().getRealPath("/dabomweb/resources/upload-files/" + videoNo + "video_file_name");
		File vFile = new File(path);
        
    	if( vFile.exists() ){
    		vFile.delete();
    	}
    	path = req.getServletContext().getRealPath("/dabomweb/resources/upload-files/" + videoNo + "thumbnail_file_name");
    	File tFile = new File(path);
        
    	if( tFile.exists() ){
    		if(tFile.delete())tFile.delete();
    	}     	
    	////////////////////////////////////
			
		
		
		
		String uploadDir = req.getServletContext().getRealPath("resources/upload-files");
		
		String videoFileName = video.getOriginalFilename(); // 파일 이름 가져와
		String thumbnailFileName = thumbnail.getOriginalFilename();
		
		if (videoFileName != null && videoFileName.length() > 0 && thumbnailFileName != null
				&& thumbnailFileName.length() > 0) {
			
			String videoSavedName = Util.makeUniqueFileName(videoFileName);	// 고유 파일 이름을 만드는 메서드(common/Util에서
																			// makeUniqueFileName 참조)에 videoFileName를
																			// 대입한 결과물은 savedFileName
			vUpload.setVideoFileName(videoFileName);
			vUpload.setVideoSavedName(videoSavedName);
			
			String thumbnailSavedName = Util.makeUniqueFileName(thumbnailFileName); // 고유 파일 이름을 만드는 메서드(common/Util에서
																					// makeUniqueFileName 참조)에
																					// videoFileName를 대입한 결과물은
																					// savedFileName
			vUpload.setThumbnailFileName(thumbnailFileName);
			vUpload.setThumbnailSavedName(thumbnailSavedName);
			
			try {
				File alter = new File(uploadDir, videoSavedName);
				video.transferTo(alter); // 파일 저장
				alter = new File(uploadDir, thumbnailSavedName);
				thumbnail.transferTo(alter); // 파일 저장
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		videoUploadService.update(vUpload);
		
		return "redirect:uploadList";

	}

}
