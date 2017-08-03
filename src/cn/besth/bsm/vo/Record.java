package cn.besth.bsm.vo;

import java.util.Date;


/**
 * Record entity. @author MyEclipse Persistence Tools
 */

public class Record  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private User User;
     private Customer customer;
     private Room room;
     private Float subtotal;
     private Date buydate;
     private Integer isok;
     private String remark;
     

    // Constructors

    /** default constructor */
    public Record() {
    }

    
    /** full constructor */
    public Record(User User, Customer customer, Room room, Float subtotal, Date buydate, Integer isok, String remark) {
        this.User = User;
        this.customer = customer;
        this.room = room;
        this.subtotal = subtotal;
        this.buydate = buydate;
        this.isok = isok;
        this.remark = remark;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return this.User;
    }
    
    public void setUser(User User) {
        this.User = User;
    }

    public Customer getCustomer() {
        return this.customer;
    }
    
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Room getRoom() {
        return this.room;
    }
    
    public void setRoom(Room room) {
        this.room = room;
    }

    public Float getSubtotal() {
        return this.subtotal;
    }
    
    public void setSubtotal(Float subtotal) {
        this.subtotal = subtotal;
    }

    public Date getBuydate() {
        return this.buydate;
    }
    
    public void setBuydate(Date buydate) {
        this.buydate = buydate;
    }

    public Integer getIsok() {
        return this.isok;
    }
    
    public void setIsok(Integer isok) {
        this.isok = isok;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }
   








}