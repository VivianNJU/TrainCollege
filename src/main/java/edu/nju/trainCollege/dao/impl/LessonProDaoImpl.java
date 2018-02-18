package edu.nju.trainCollege.dao.impl;

import edu.nju.trainCollege.dao.LessonProDao;
import edu.nju.trainCollege.model.LessonProgress;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LessonProDaoImpl implements LessonProDao {
    @Autowired
    private SessionFactory sessionFactory;

    private static final String fromDatabase = "from LessonProgress ";
    private static final String searchByOrderId = "where oid = :oid";
    private static final String searchByUserId = "where uid = :uid";
    private static final String searchByCollegeId = "where cid = :cid";
    private static final String searchByClassId = "where classId = :classId";

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }
    public List<LessonProgress> getByOrderId(int oid) {
        Query query = getCurrentSession().createQuery(fromDatabase+searchByOrderId).setParameter("oid",oid);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public List<LessonProgress> getByUidState(String uid,int state) {
        Query query;
        if(state>=0){
            query = getCurrentSession().createQuery(fromDatabase+searchByUserId+" and state = :state")
                    .setParameter("uid",uid).setParameter("state",state);
        }else{
            query = getCurrentSession().createQuery(fromDatabase+searchByUserId).setParameter("uid",uid);
        }
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public List<LessonProgress> getByCollegeId(int cid) {
        Query query = getCurrentSession().createQuery(fromDatabase+searchByCollegeId).setParameter("cid",cid);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public List<LessonProgress> getByClassIdNo(int classId, int classNo) {
        Query query;
        if(classNo<0){
            query = getCurrentSession().createQuery(fromDatabase+searchByClassId+" and state=1").setParameter("classId",classId);
        }else{
            query = getCurrentSession().createQuery(fromDatabase+searchByClassId+" and classNo =:classNo").setParameter("classNo",classNo);
        }

        return query.list();
    }

    public LessonProgress get(Integer id) {
        return getCurrentSession().get(LessonProgress.class,id);
    }

    public void persist(LessonProgress entity) {

    }

    public Integer save(LessonProgress entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        Integer id = (Integer) session.save(entity);
        tx.commit();

        return id;
    }

    public void saveOrUpdate(LessonProgress entity) {
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
