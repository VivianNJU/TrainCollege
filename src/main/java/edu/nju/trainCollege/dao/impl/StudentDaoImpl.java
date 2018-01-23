package edu.nju.trainCollege.dao.impl;

import edu.nju.trainCollege.dao.StudentDao;
import edu.nju.trainCollege.model.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDaoImpl implements StudentDao {
    @Autowired
    private SessionFactory sessionFactory;

    private static final String searchByEmailPwd = "from Student where email = :email and password = :password";
    private static final String searchByEmail = "from Student where email = :email";

    private Session getCurrentSession() {
        return this.sessionFactory.openSession();
    }


    public Student get(Integer id) {
        return getCurrentSession().get(Student.class,id);
    }

    public void persist(Student entity) {
        getCurrentSession().persist(entity);
    }

    public Integer save(Student entity) {
        Session session = getCurrentSession();
        Transaction tx=session.beginTransaction();
        Integer id = (Integer) session.save(entity);
        tx.commit();

        return id;
    }

    public void saveOrUpdate(Student entity) {
        getCurrentSession().saveOrUpdate(entity);
    }

    public void delete(Integer id) {
        Student person = getCurrentSession().load(Student.class,id);
        getCurrentSession().delete(person);
    }

    public void flush() {
        getCurrentSession().flush();
    }

    public Student getByEmailPwd(String email, String password) {
        Query query = getCurrentSession().createQuery(searchByEmailPwd).setParameter("email",email).setParameter("password",password);
        if(query.list().size()==0)
            return null;
        else{
            return (Student) query.list().get(0);
        }
    }

    public Student getByEmail(String email) {
        Query query = getCurrentSession().createQuery(searchByEmail).setParameter("email",email);
        if(query.list().size()==0)
            return null;
        else{
            return (Student) query.list().get(0);
        }
    }
}
