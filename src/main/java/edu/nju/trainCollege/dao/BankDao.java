package edu.nju.trainCollege.dao;

import edu.nju.trainCollege.model.BankCard;
import edu.nju.trainCollege.model.PayRecord;

import java.util.List;

public interface BankDao extends BaseDao<PayRecord,Integer> {

    public PayRecord findByOrderId(int oid);

    public List<PayRecord> findByUid(int uid);

    public BankCard findByCardIDPwd(String bankCardID, String password);

    /**
     * 更新银行卡余额
     * @param id 银行卡号
     * @param balance 余额变动的差值，可正可负
     */
    public void saveCard(String id, double balance);

}
