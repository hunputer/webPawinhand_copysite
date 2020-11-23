package com.ph4.s1.store.storeFile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ph4.s1.store.product.ProductDTO;

@Service
public class StoreFileService {

	@Autowired
	private StoreFileDAO storeFileDAO;
	
	public List<StoreFileDTO> getFiles(ProductDTO productDTO){
		return storeFileDAO.getFiles(productDTO);
	}
}
