package edu.nju.trainCollege.dao.impl;

import edu.nju.trainCollege.dao.BankDao;
import edu.nju.trainCollege.model.BankCard;
import edu.nju.trainCollege.model.PayRecord;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BankDaoImpl implements BankDao {
    @Autowired
    private SessionFactory sessionFactory;
    private static final String fromCardDb = "from BankCard ";
    private static final String fromRecordDb = "from PayRecord ";
    private static final String searchByIdPwd = "where cardNo = :id and password = :password";
    private static final String searchByOid = "where oid = :oid";

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }

    public PayRecord findByOrderId(int oid) {
        Query query = getCurrentSession().createQuery(fromRecordDb+searchByOid).setParameter("oid",oid);
        if(query.list().size()==0)
            return null;
        else{
            return (PayRecord) query.list().get(0);
        }
    }

    public BankCard findByCardIDPwd(String bankCardID, String password) {
        Query query = getCurrentSession().createQuery(fromCardDb+searchByIdPwd).setParameter("id",bankCardID)
                .setParameter("password",password);
        if(query.list().size()==0)
            return null;
        else{
            return (BankCard) query.list().get(0);
        }
    }

    public void saveCard(String id, double balance) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        BankCard card = getCurrentSession().get(BankCard.class,id);
        card.setBalance(card.getBalance()+balance);
        session.saveOrUpdate(card);
        tx.commit();
    }

    public PayRecord get(Integer id) {
        return getCurrentSession().get(PayRecord.class,id);
    }

    public void persist(PayRecord entity) {

    }

    public Integer save(PayRecord entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        Integer id = (Integer) session.save(entity);
        tx.commit();

        return id;
    }

    public void saveOrUpdate(PayRecord entity) {
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
