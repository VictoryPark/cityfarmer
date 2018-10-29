package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.GalleryBoard;


public interface GalleryMapper {
	List<GalleryBoard> selectGalleryBoard();
	void insertGalleryBoard(GalleryBoard galleryboard);
	int seLectGalleryBoardCount();

}