package com.james.productsandcategories.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.james.productsandcategories.models.Category;
import com.james.productsandcategories.models.Product;
import com.james.productsandcategories.services.CategoryService;
import com.james.productsandcategories.services.ProductService;

@Controller
public class MainController {
	private final ProductService productService;
	private final CategoryService categoryService;
	
	public MainController(ProductService productService, CategoryService categoryService) {
		this.productService = productService;
		this.categoryService = categoryService;
	}
	
	@RequestMapping("/")
	public String home() {
		return "index.jsp";
	}
	
	@RequestMapping("/products/new")
	public String newProduct(@ModelAttribute("product") Product product, Model model) {
		return "product.jsp";
	}
	
	@RequestMapping(value="/products", method = RequestMethod.POST)
	public String createProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "product.jsp";
		} else {
			productService.createProduct(product);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/categories/new")
	public String newCategory(@ModelAttribute("category") Category category, Model model) {
		return "category.jsp";
	}
	
	@RequestMapping(value="/categories", method=RequestMethod.POST)
	public String createCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(result.hasErrors()) {
			return "category.jsp";
		} else {
			categoryService.createCategory(category);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/products/all")
	public String displayProducts(@ModelAttribute("product") Product product, Model model) {
		List<Product> products = productService.allProducts();
		model.addAttribute("products", products);
		return "showproducts.jsp";
	}
	@RequestMapping("/categories/all")
	public String displayCategories(@ModelAttribute("category") Category category, Model model) {
		List<Category> categories = categoryService.allCategories();
		model.addAttribute("categories", categories);
		return "showcategories.jsp";
	}
	@RequestMapping("/product/{id}")
	public String displayProduct(@ModelAttribute("category") Category category, @PathVariable("id") Long id, Model model) {
		Product product = productService.findProduct(id);
		model.addAttribute("product", product);
		List<Category> categories = categoryService.categoryProduct(product);
		model.addAttribute("categories", categories);
		return "oneproduct.jsp";
	}
	@RequestMapping("/category/{id}")
	public String displayCategory(@ModelAttribute("product") Product product, @PathVariable("id") Long id,  Model model) {
		Category category = categoryService.findCategory(id);
		model.addAttribute("category", category);
		List<Product> products = productService.productCategory(category);
		model.addAttribute("products", products);
		return "onecategory.jsp";
	}
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.PUT)
	public String update(@RequestParam("categories") Long categoryId, @PathVariable("id")Long id) {
		Product product = productService.findProduct(id);
		Category category = categoryService.findCategory(categoryId);
		List<Category> categories = product.getCategories();
		categories.add(category);
		productService.updateProduct(product);
		return "redirect:/product/" + id;
	}
	
	@RequestMapping(value="/updateCat/{id}", method = RequestMethod.PUT)
	public String updateCat(@RequestParam("products") Long productId, @PathVariable("id")Long id) {
		Category category = categoryService.findCategory(id);
		Product product = productService.findProduct(productId);
		List<Product> products = category.getProducts();
		products.add(product);
		categoryService.updateCategory(category);
		return "redirect:/category/" + id;
	}
	

}
