package com.ph4.s1.store.product.productDetail;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ph4.s1.lostFile.LostFileDTO;
import com.ph4.s1.util.FileSaver;

@Service
public class ProductDetailService {
	
	@Autowired
	public ProductDetailDAO productDetailDAO;
	
	@Autowired
	public FileSaver fileSaver;
	
	public int setInsert(ProductDetailDTO productDetailDTO, MultipartFile[] files, HttpSession session) throws Exception{
		int result = productDetailDAO.setDelete(productDetailDTO);
		String path = session.getServletContext().getRealPath("/resources/img/upload/product/detail");
		System.out.println(path);
		File dest = new File(path);
		for(MultipartFile file : files) {
			String fileName = fileSaver.save(dest, file);
			productDetailDTO.setFileName(fileName);
			productDetailDTO.setOriName(file.getOriginalFilename());
			result = productDetailDAO.setInsert(productDetailDTO);
		}
		return result;
	}
	
	public List<ProductDetailDTO> getList(ProductDetailDTO productDetailDTO){
		return productDetailDAO.getList(productDetailDTO);
	}
	
	public int setDelete(ProductDetailDTO productDetailDTO) {
		return productDetailDAO.setDelete(productDetailDTO);
	}
}
