package com.james.productsandcategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.james.productsandcategories.models.Category;
import com.james.productsandcategories.models.Product;
import com.james.productsandcategories.repositories.CategoryRepository;

@Service
public class CategoryService {
	private final CategoryRepository categoryRepository;
	
	public CategoryService(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}
	
	public Category createCategory(Category category) {
		return categoryRepository.save(category);
	}
	
	public List<Category> allCategories(){
		return categoryRepository.findAll();
	}
	
	public List<Category> categoryProduct(Product product){
		return categoryRepository.findByProductsNotContains(product);
	}
	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepository.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}
	
	public Category updateCategory(Category category) {
		return categoryRepository.save(category);
	}
	
	public void deleteById(Long id) {
		categoryRepository.deleteById(id);
	}
}
