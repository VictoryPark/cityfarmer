package com.cityfarmer.gallery.service;

import java.util.Map;

import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryFile;

public interface GalleryService {
	int count();	//전체게시물

	Map<String, Object> list(int pageNo); // 조회
	
//	List<GalleryBoard> list(GalleryBoard galleryboard); // 조회
	
	void write(GalleryBoard galleryboard, GalleryFile file); // 등록
	
//	GalleryBoard detail(int gaNo); //상세
	Map<String, Object> detail(int gaNo); //상세
	
	void delete(int no); // 삭제
	
	//수정
	void update(GalleryBoard galleryboard);
	GalleryBoard updateForm(int no);

	//파일등록
	void uploadFile(GalleryFile file);

}
