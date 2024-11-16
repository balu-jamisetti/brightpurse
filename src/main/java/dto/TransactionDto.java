package dto;

public class TransactionDto {
	private Long receiverAccount;
	private String IFSCcode;
	private int amount;
	private long pin;
	private long ph_no;
	public Long getReceiverAccount() {
		return receiverAccount;
	}
	public void setReceiverAccount(Long receiverAccount) {
		this.receiverAccount = receiverAccount;
	}
	public String getIFSCcode() {
		return IFSCcode;
	}
	public void setIFSCcode(String iFSCcode) {
		IFSCcode = iFSCcode;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public long getPin() {
		return pin;
	}
	public void setPin(long pin) {
		this.pin = pin;
	}
	public long getPh_no() {
		return ph_no;
	}
	public void setPh_no(long ph_no) {
		this.ph_no = ph_no;
	}
	public TransactionDto(Long receiverAccount, String iFSCcode, int amount, long pin, long ph_no) {
		super();
		this.receiverAccount = receiverAccount;
		IFSCcode = iFSCcode;
		this.amount = amount;
		this.pin = pin;
		this.ph_no = ph_no;
	}
	public TransactionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
