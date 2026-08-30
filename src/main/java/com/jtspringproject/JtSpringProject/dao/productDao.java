package com.jtspringproject.JtSpringProject.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jtspringproject.JtSpringProject.models.Product;

@Repository
public class productDao {
	private final SessionFactory sessionFactory;

	public productDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public List<Product> getProducts() {
		return this.sessionFactory.getCurrentSession().createQuery("from PRODUCT", Product.class).list();
	}

	@Transactional
	public Product addProduct(Product product) {
		this.sessionFactory.getCurrentSession().save(product);
		return product;
	}

	@Transactional
	public Product getProduct(int id) {
		return this.sessionFactory.getCurrentSession().get(Product.class, id);
	}

	@Transactional
	public Product updateProduct(Product product) {
		this.sessionFactory.getCurrentSession().update(product);
		return product;
	}

	@Transactional
	public Boolean deleteProduct(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Product product = session.get(Product.class, id);

		if (product != null) {
			session.delete(product);
			return true;
		}
		return false;
	}

	@Transactional
	public List<Product> searchProducts(String search, String category) {

		String hql = "from PRODUCT p where 1=1";

		if (search != null && !search.isBlank()) {
			hql += " and lower(p.name) like :search";
		}

		if (category != null && !category.isBlank()) {
			hql += " and lower(p.category.name) = :category";
		}

		var query = this.sessionFactory.getCurrentSession()
				.createQuery(hql, Product.class);

		if (search != null && !search.isBlank()) {
			query.setParameter("search", "%" + search.toLowerCase() + "%");
		}

		if (category != null && !category.isBlank()) {
			query.setParameter("category", category.toLowerCase());
		}

		return query.list();
	}

}
