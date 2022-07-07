package com.dabom.service;

import com.dabom.dto.Member;

public interface AccountService {
	
	public void registerMember(Member meber);
	public Member login(Member member);
	
	
}
