package com.cityfarmer.gallery.service;

import java.util.List;

import com.cityfarmer.repository.domain.gallery.GalleryBoard;

public interface GalleryService {

	List<GalleryBoard> list(GalleryBoard galleryboard);
	void write(GalleryBoard galleryboard);
	int count();
	GalleryBoard detail(int gaNo);
	void delete(int no);
	
	
	void update(GalleryBoard galleryboard);
	GalleryBoard updateForm(int no);

}
