package com.currency.dao;

import com.currency.model.Currency;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class CurrencyDaoImpl implements CurrencyDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    @Transactional
    public void save(Currency currency) {
        hibernateTemplate.save(currency);
    }

    @Override
    @Transactional
    public List<Currency> getAll(int pageId, int pageSize) {
        Session session = sessionFactory.getCurrentSession();
        // Calculate the first result index for the given page
        int firstResult = (pageId - 1) * pageSize;
        Query<Currency> query = session.createQuery("FROM Currency ORDER BY id DESC", Currency.class);
        // Set pagination parameters
        query.setFirstResult(firstResult);
        query.setMaxResults(pageSize);

        return query.getResultList();
    }


}
