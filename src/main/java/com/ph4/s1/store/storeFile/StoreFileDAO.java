package com.ph4.s1.store.storeFile;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ph4.s1.store.product.ProductDTO;

@Repository
public class StoreFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String NAMESPACE = "com.ph4.s1.store.storeFile.StoreFileDAO.";
	
	public List<StoreFileDTO> getFiles(ProductDTO productDTO){
		return sqlSession.selectList(NAMESPACE+"getFiles",productDTO);
	}
	
	public StoreFileDTO getOne(ProductDTO productDTO) {
		return sqlSession.selectOne(NAMESPACE+"getOne", productDTO);
	}
	
	public int setInsert(StoreFileDTO storeFileDTO) {
		return sqlSession.insert(NAMESPACE+"setInsert", storeFileDTO);
	}
	
	public int setDelete(ProductDTO productDTO) {
		return sqlSession.delete(NAMESPACE+"setDelete", productDTO);
	}
	
}
