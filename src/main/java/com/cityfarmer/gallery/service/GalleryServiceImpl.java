package com.cityfarmer.gallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cityfarmer.repository.domain.GalleryBoard;
import com.cityfarmer.repository.mapper.GalleryMapper;

@Service
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired
	private GalleryMapper gamapper;

	@Override
	public List<GalleryBoard> list() {
		
		return gamapper.selectGalleryBoard();
	}
	
	

}
