package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.gallery.GalleryBoard;
import com.cityfarmer.repository.domain.gallery.GalleryFile;


public interface GalleryMapper {
	List<GalleryBoard> selectGalleryBoard(GalleryBoard galleryboard);
	int insertGalleryBoard(GalleryBoard galleryboard);
	int seLectGalleryBoardCount();
	GalleryBoard selectGalleryBoardByNo(int no);
	void GalleryDeleteBoard(int no); // 게시글 삭제
	void GalleryUpdateBoard(GalleryBoard galleryboard); //업데이트 
	
	void insertGalleryFile(GalleryFile file);//파일 등록


}
