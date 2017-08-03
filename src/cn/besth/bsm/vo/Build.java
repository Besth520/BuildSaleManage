package cn.besth.bsm.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Build entity. @author MyEclipse Persistence Tools
 */

public class Build  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private House house;
     private String name;
     private Integer construction;
     private Integer direction;
     private Integer type;
     private Date sdate;
     private Integer sum;
     private String remark;
     private Set rooms = new HashSet(0);
     
     public String getAllName(){
    	 return house.getName()+name;
     }


    // Constructors

    /** default constructor */
    public Build() {
    }

    
    /** full constructor */
    public Build(House house, String name, Integer construction, Integer direction, Integer type, Date sdate, Integer sum, String remark, Set rooms) {
        this.house = house;
        this.name = name;
        this.construction = construction;
        this.direction = direction;
        this.type = type;
        this.sdate = sdate;
        this.sum = sum;
        this.remark = remark;
        this.rooms = rooms;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public House getHouse() {
        return this.house;
    }
    
    public void setHouse(House house) {
        this.house = house;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }


    public Integer getConstruction() {
		return construction;
	}


	public void setConstruction(Integer construction) {
		this.construction = construction;
	}


	public Integer getDirection() {
		return direction;
	}


	public void setDirection(Integer direction) {
		this.direction = direction;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public Date getSdate() {
        return this.sdate;
    }
    
    public void setSdate(Date sdate) {
        this.sdate = sdate;
    }

    public Integer getSum() {
        return this.sum;
    }
    
    public void setSum(Integer sum) {
        this.sum = sum;
    }

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Set getRooms() {
        return this.rooms;
    }
    
    public void setRooms(Set rooms) {
        this.rooms = rooms;
    }
   








}