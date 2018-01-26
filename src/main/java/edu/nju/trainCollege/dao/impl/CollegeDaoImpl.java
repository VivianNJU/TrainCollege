package edu.nju.trainCollege.dao.impl;

import edu.nju.trainCollege.dao.CollegeDao;
import edu.nju.trainCollege.model.College;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CollegeDaoImpl implements CollegeDao {
    @Autowired
    private SessionFactory sessionFactory;

    private static final String searchByEmailPwd = "from College where id = :id and password = :password";

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }
    public College getByIdPwd(int id, String password) {
        Query query = getCurrentSession().createQuery(searchByEmailPwd).setParameter("id",id).setParameter("password",password);
        if(query.list().size()==0)
            return null;
        else{
            return (College) query.list().get(0);
        }
    }

    public College get(Integer id) {
        return getCurrentSession().get(College.class,id);
    }

    public void persist(College entity) {
        getCurrentSession().persist(entity);
    }

    public Integer save(College entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        Integer id = (Integer) session.save(entity);
        tx.commit();

        return id;
    }

    public void saveOrUpdate(College entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        session.saveOrUpdate(entity);
        tx.commit();
    }

    public void delete(Integer id) {

    }

    public void flush() {
        getCurrentSession().flush();
    }
}
