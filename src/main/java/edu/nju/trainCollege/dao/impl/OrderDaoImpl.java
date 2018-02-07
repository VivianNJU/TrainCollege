package edu.nju.trainCollege.dao.impl;

import edu.nju.trainCollege.dao.OrderDao;
import edu.nju.trainCollege.model.Orders;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {
    @Autowired
    private SessionFactory sessionFactory;

    private static final String fromDatabase = "from Orders ";
    private static final String searchByUserId = "where uid = :uid";
    private static final String searchByCollegeId = "where cid = :cid";

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }
    public List<Orders> getByUserId(int uid) {
        Query query = getCurrentSession().createQuery(fromDatabase+searchByUserId).setParameter("uid",uid);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public List<Orders> getByCollegeId(int cid) {
        Query query = getCurrentSession().createQuery(fromDatabase+searchByCollegeId).setParameter("cid",cid);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public Orders get(Integer id) {
        return getCurrentSession().get(Orders.class,id);
    }

    public void persist(Orders entity) {

    }

    public Integer save(Orders entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        session.save(entity);
        tx.commit();

        Query query = getCurrentSession().createQuery(fromDatabase+searchByUserId+" and cid= :cid and lid= :lid" +
                " and orderTime= :time").setParameter("uid",entity.getUid()).setParameter("cid",entity.getCid())
                .setParameter("lid",entity.getLid()).setParameter("time",entity.getOrderTime());
        if(query.list().size()==0)
            return 0;
        else{
            return ((Orders) query.list().get(0)).getId();
        }
    }

    public void saveOrUpdate(Orders entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        session.saveOrUpdate(entity);
        tx.commit();
    }

    public void delete(Integer id) {

    }

    public void flush() {

    }
}
