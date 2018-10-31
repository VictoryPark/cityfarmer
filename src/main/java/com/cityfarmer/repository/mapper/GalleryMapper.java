package com.cityfarmer.repository.mapper;

import java.util.List;

import com.cityfarmer.repository.domain.gallery.GalleryBoard;


public interface GalleryMapper {
	List<GalleryBoard> selectGalleryBoard(GalleryBoard galleryboard);
	void insertGalleryBoard(GalleryBoard galleryboard);
	int seLectGalleryBoardCount();

}
