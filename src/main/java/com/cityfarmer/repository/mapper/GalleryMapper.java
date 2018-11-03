package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryFile;


public interface GalleryMapper {
	List<GalleryBoard> selectGalleryBoard(GalleryBoard galleryboard); // 리스트
	
	int seLectGalleryBoardCount();//전체 개시물 수
	
	GalleryBoard selectGalleryBoardByNo(int no); //상세
	
	void GalleryDeleteBoard(int no); // 게시글 삭제
	
	void GalleryUpdateBoard(GalleryBoard galleryboard); //업데이트 
	
	int insertGalleryBoard(GalleryBoard galleryboard); //게시글 등록
	
	void insertGalleryFile(GalleryFile file);//파일 등록

	GalleryFile selectFileByGaNo(int gaNo);

}
