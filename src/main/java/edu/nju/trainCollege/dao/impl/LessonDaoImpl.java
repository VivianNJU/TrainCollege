package edu.nju.trainCollege.dao.impl;

import edu.nju.trainCollege.dao.LessonDao;
import edu.nju.trainCollege.model.Lesson;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public class LessonDaoImpl implements LessonDao {

    @Autowired
    private SessionFactory sessionFactory;

    private static final String fromDatabase = "from Lesson ";
    private static final String searchByCollegeId = "where cid = :cid";
    private static final String searchByName = "where name like :name";
    private static final String searchByType = "where type like :type";
    private static final String searchBetweenDates= "where startDay >= :start and endDay <= :end";

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }

    public List<Lesson> getByCollegeId(int cid) {
        Query query = getCurrentSession().createQuery(fromDatabase+searchByCollegeId).setParameter("cid",cid);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public List<Lesson> getByName(String name) {
        name = "%"+name+"%";
        Query query = getCurrentSession().createQuery(fromDatabase+searchByName).setParameter("name",name);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public List<Lesson> getByLessonType(String type) {
        type = "%"+type+"%";
        Query query = getCurrentSession().createQuery(fromDatabase+searchByType).setParameter("type",type);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public List<Lesson> getBetweenDates(Date start, Date end) {
        Query query = getCurrentSession().createQuery(fromDatabase+searchBetweenDates).setParameter("start",start)
                .setParameter("end",end);
        if(query.list().size()==0)
            return null;
        else{
            return query.list();
        }
    }

    public Lesson get(Integer id) {
        return getCurrentSession().get(Lesson.class,id);
    }

    public void persist(Lesson entity) {

    }

    public Integer save(Lesson entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        session.save(entity);
        tx.commit();

        Query query = getCurrentSession().createQuery(fromDatabase+searchByCollegeId+" and name= :name and type= :type" +
                " and startDay= :start and endDay= :end").setParameter("name",entity.getName()).setParameter("cid",entity.getCid())
                .setParameter("end",entity.getEndDay()).setParameter("start",entity.getStartDay()).setParameter("type",entity.getType());;
        if(query.list().size()==0)
            return 0;
        else{
            return ((Lesson) query.list().get(0)).getId();
        }
    }

    public void saveOrUpdate(Lesson entity) {
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
