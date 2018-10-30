package com.cityfarmer.gallery.service;

import java.util.List;

import com.cityfarmer.repository.domain.GalleryBoard;

public interface GalleryService {

	List<GalleryBoard> list(GalleryBoard galleryboard);
	void write(GalleryBoard galleryboard);
	int count();

}
