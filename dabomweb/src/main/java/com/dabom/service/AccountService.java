package com.dabom.service;

import com.dabom.dto.Member;

public interface AccountService {
	
	 void registerMember(Member member);
	 Member login(Member member);
	
	
	
}
