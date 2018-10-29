package com.cityfarmer.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.GalleryBoard;
import com.cityfarmer.repository.mapper.GalleryMapper;

@Service
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	private GalleryMapper gaMapper;

	@Override
	public List<GalleryBoard> list() {
		
		return gaMapper.selectGalleryBoard();
	}
	@Override
	public void write(GalleryBoard galleryboard) {
		gaMapper.insertGalleryBoard(galleryboard);
	}
	
	@Override
	public int count() {
		return gaMapper.seLectGalleryBoardCount();
	}
	
	

}
