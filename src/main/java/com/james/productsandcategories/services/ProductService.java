package com.james.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.james.productsandcategories.models.Category;
import com.james.productsandcategories.models.Product;
import com.james.productsandcategories.repositories.ProductRepository;

@Service
public class ProductService {
	private final ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	
	public Product createProduct(Product product) {
		return productRepository.save(product);
	}

	public List<Product> allProducts(){
		return productRepository.findAll();
	}
	public List<Product> productCategory(Category category){
		return productRepository.findByCategoriesNotContains(category);
	}
	
	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepository.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		} else {
			return null;
		}
	}
	
	public Product updateProduct(Product product) {
		return productRepository.save(product);
	}
	
	public void deleteById(Long id) {
		productRepository.deleteById(id);
	}
}
