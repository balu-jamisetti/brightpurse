package dto;

public class AccountDto {
	private String name;
	private long ph_No;
	private long account_Number;
	private String ifsc_Code;
	private String account_Type;
	private int pin;
	private long aadhar_No;
	private int balance;
	private String nominee_Name;
	private String relation_With_Nominee;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPh_No() {
		return ph_No;
	}
	public void setPh_No(long ph_No) {
		this.ph_No = ph_No;
	}
	public long getAccount_Number() {
		return account_Number;
	}
	public void setAccount_Number(long account_Number) {
		this.account_Number = account_Number;
	}
	public String getIfsc_Code() {
		return ifsc_Code;
	}
	public void setIfsc_Code(String ifsc_Code) {
		this.ifsc_Code = ifsc_Code;
	}
	public String getAccount_Type() {
		return account_Type;
	}
	public void setAccount_Type(String account_Type) {
		this.account_Type = account_Type;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	public long getAadhar_No() {
		return aadhar_No;
	}
	public void setAadhar_No(long aadhar_No) {
		this.aadhar_No = aadhar_No;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getNominee_Name() {
		return nominee_Name;
	}
	public void setNominee_Name(String nominee_Name) {
		this.nominee_Name = nominee_Name;
	}
	public String getRelation_With_Nominee() {
		return relation_With_Nominee;
	}
	public void setRelation_With_Nominee(String relation_With_Nominee) {
		this.relation_With_Nominee = relation_With_Nominee;
	}
	public AccountDto(String name, long ph_No, long account_Number, String ifsc_Code, String account_Type, int pin,
			long aadhar_No, int balance, String nominee_Name, String relation_With_Nominee) {
		super();
		this.name = name;
		this.ph_No = ph_No;
		this.account_Number = account_Number;
		this.ifsc_Code = ifsc_Code;
		this.account_Type = account_Type;
		this.pin = pin;
		this.aadhar_No = aadhar_No;
		this.balance = balance;
		this.nominee_Name = nominee_Name;
		this.relation_With_Nominee = relation_With_Nominee;
	}
	public AccountDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "AccountDto [name=" + name + ", ph_No=" + ph_No + ", account_Number=" + account_Number + ", ifsc_Code="
				+ ifsc_Code + ", account_Type=" + account_Type + ", pin=" + pin + ", aadhar_No=" + aadhar_No
				+ ", balance=" + balance + ", nominee_Name=" + nominee_Name + ", relation_With_Nominee="
				+ relation_With_Nominee + "]";
	}
	
}