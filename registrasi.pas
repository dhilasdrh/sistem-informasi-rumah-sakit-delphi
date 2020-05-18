unit registrasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, Grids, DBGrids, DB, ADODB, DateUtils,
  Menus, frxClass, frxDBSet;

type
  TForm3 = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    Button2: TButton;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    save: TButton;
    save2: TButton;
    Edit6: TEdit;
    Search: TButton;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    Registrasi1: TMenuItem;
    DataDokter: TMenuItem;
    RawatJalan1: TMenuItem;
    RawatInap1: TMenuItem;
    Laporan1: TMenuItem;
    Home1: TMenuItem;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Memo1: TMemo;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    ADOQuery1: TADOQuery;
    edit: TButton;
    delete: TButton;
    Add: TButton;
    Button1: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure save2Click(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure homeClick(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure DataDokterClick(Sender: TObject);
    procedure RawatJalan1Click(Sender: TObject);
    procedure RawatInap1Click(Sender: TObject);
    procedure Laporan1Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses login, dokter, RawatJalan, pasien, datamedis;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  Memo1.Text:='';
  edit1.Text:='NO-00'+IntToStr(ADOQuery1.recordcount+1);
  edit2.Text:='RM-010-00'+IntToStr(ADOQuery1.recordcount+1);
  DateTimePicker1.Date:=DateOf(today);

  ComboBox1.Text:='';
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox4.Text:='';
  edit3.clear;
  edit4.clear;
  edit5.clear;
  memo1.Clear;
  edit8.clear;
  edit9.clear;
  radiobutton1.Checked:=false;
  radiobutton2.checked:=false;

  Save2.Visible:=false;
  save.visible:=true;
  Add.Enabled:=false;
  Save.Enabled:=true;
  edit.enabled:=false;
  delete.enabled:=false;

end;

procedure TForm3.saveClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Open;
    Append;
    FieldByName('No_registrasi').AsString:=edit1.Text;
    FieldByName('tgl_registrasi').AsString:=DateToStr(DateTimePicker1.Date);
    FieldByName('no_rm').AsString:=edit2.Text;
    FieldByName('nama_pasien').AsString:=edit3.Text;
    FieldByName('nik').AsString:=Edit4.Text;
    FieldByName('tgl_lahir').AsString:=DateToStr(DateTimePicker2.Date);
    FieldByName('umur').AsString:=Edit5.Text;
    FieldByName('Jenis_kelamin').AsString:=ComboBox1.Text;
    FieldByName('gol_darah').AsString:=ComboBox2.Text;
    FieldByName('alamat').AsString:=Memo1.Text;
    FieldByName('no_hp').AsString:=Edit4.Text;
    FieldByName('pekerjaan').AsString:=ComboBox3.Text;
    FieldByName('nama_penanggung').AsString:=Edit9.Text;
    if RadioButton1.Checked = true then
      FieldByName('jenis_pasien').AsString:='Umum';
    if RadioButton2.Checked = true then
      FieldByName('jenis_pasien').AsString:='BPJS';
    FieldByName('jenis_pembayaran').AsString:=ComboBox4.Text;
    //FieldByName('poli').AsString:=ComboBox5.Text;
    Post;
   end;

  MessageDlg('Data berhasil disimpan',mtInformation,[mbOK],0);

  Add.enabled:=true;
  edit.enabled:=true;
  delete.enabled:=true;
  save2.Enabled:=false;
 end;

procedure TForm3.DateTimePicker2Change(Sender: TObject);
var umur, tl, ts: Integer;
begin
  tl := Yearof(now);
  ts := YearOf(DateTimePicker2.Date);
  umur := tl -ts;
  edit5.Text := IntToStr(umur);
end;

procedure TForm3.AddClick(Sender: TObject);
begin
  edit1.Text:='NO-00'+IntToStr(ADOQuery1.recordcount+1);
  edit2.Text:='RM-010-00'+IntToStr(ADOQuery1.recordcount+1);

  ComboBox1.Text:='';
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox4.Text:='';
  edit3.clear;
  edit4.clear;
  edit5.clear;
  memo1.Clear;
  edit8.clear;
  edit9.clear;
  radiobutton1.Checked:=false;
  radiobutton2.checked:=false;

  save.Visible:=true;
  save2.visible:=false;
  save.Enabled:=true;
  save2.Enabled:=false;
  edit.Enabled:=false;
  delete.Enabled:=false;
end;

procedure TForm3.editClick(Sender: TObject);
begin
  Save.Visible:=false;
  Save2.Visible:=true;
  Save2.Enabled:=true;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm3.save2Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Open;
    Edit;
    FieldByName('No_registrasi').AsString:=edit1.Text;
    FieldByName('tgl_registrasi').AsString:=DateToStr(DateTimePicker1.Date);
    FieldByName('no_rm').AsString:=edit2.Text;
    FieldByName('nama_pasien').AsString:=edit3.Text;
    FieldByName('nik').AsString:=Edit4.Text;
    FieldByName('tgl_lahir').AsString:=DateToStr(DateTimePicker2.Date);
    FieldByName('umur').AsString:=Edit5.Text;
    FieldByName('Jenis_kelamin').AsString:=ComboBox1.Text;
    FieldByName('gol_darah').AsString:=ComboBox2.Text;
    FieldByName('alamat').AsString:=Memo1.Text;
    FieldByName('no_hp').AsString:=Edit4.Text;
    FieldByName('pekerjaan').AsString:=ComboBox3.Text;
    FieldByName('nama_penanggung').AsString:=Edit9.Text;
    if RadioButton1.Checked = true then
      FieldByName('jenis_pasien').AsString:='Umum';
    if RadioButton2.Checked = true then
      FieldByName('jenis_pasien').AsString:='BPJS';
    FieldByName('jenis_pembayaran').AsString:=ComboBox4.Text;
    //FieldByName('poli').AsString:=ComboBox5.Text;
    Post;
   end;

  MessageDlg('Data berhasil diedit',mtInformation,[mbOK],0);
  Save.Visible:=false;
  Save2.Visible:=true;
  Save2.Enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm3.deleteClick(Sender: TObject);
begin
    // if (application.MessageBox('Apakah Anda yakin ingin menghapus data?','Warning!',mb_yesno)=id_yes) then
    ADOQuery1.Open;
    ADOQuery1.Delete;
    MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);

  ComboBox1.Text:='';
  ComboBox2.Text:='';
  ComboBox3.Text:='';
  ComboBox4.Text:='';
  edit1.clear;
  edit2.clear;
  edit3.clear;
  edit4.clear;
  edit5.clear;
  memo1.Clear;
  edit8.clear;
  edit9.clear;
  radiobutton1.Checked:=false;
  radiobutton2.checked:=false;
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  with ADOQuery1 do
  begin
  edit1.Text:=FieldByName('No_registrasi').AsString;
  DateTimePicker1.Date:=FieldByName('tgl_registrasi').AsDateTime;
  edit2.Text:=FieldByName('no_rm').AsString;
  edit3.text:=FieldByName('nama_pasien').AsString;
  edit4.Text:=FieldByName('nik').AsString;
  DateTimePicker2.Date:=FieldByName('tgl_lahir').AsDateTime;
  edit5.Text:=FieldByName('umur').AsString;
  ComboBox1.Text:=FieldByName('Jenis_kelamin').AsString;
  ComboBox2.Text:=FieldByName('gol_darah').AsString;
  Memo1.Text:=FieldByName('alamat').AsString;
  edit8.Text:=FieldByName('no_hp').AsString;
  ComboBox3.Text:=FieldByName('pekerjaan').AsString;
  edit9.Text:=FieldByName('nama_penanggung').AsString;
  if FieldByName('jenis_pasien').AsString = 'Umum' then
    RadioButton1.Checked := true
  else if FieldByName('jenis_pasien').AsString = 'BPJS' then
    RadioButton2.Checked := true;
  ComboBox4.Text:=FieldByName('jenis_pembayaran').AsString;
  end;
  Save.Enabled:=false;  
  Add.Enabled:=true;    
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm3.homeClick(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.SearchClick(Sender: TObject);
begin
  ADOQuery1.Close;    
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from datapasien where nama_pasien like "%'+Edit6.Text+'%" or no_rm like "'+Edit6.Text+'%"');
  ADOQuery1.Open;

  save.enabled:=false;
  save2.enabled:=false;
  add.enabled:=true;
  edit.enabled:=true;
  delete.enabled:=true;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.Home1Click(Sender: TObject);
begin
  Form3.Close;
  Form1.Show;
end;

procedure TForm3.DataDokterClick(Sender: TObject);
begin
  Form5.Show;
  Form3.Close;
end;

procedure TForm3.RawatJalan1Click(Sender: TObject);
begin
  Form9.Show;
  Form3.Close;
end;

procedure TForm3.RawatInap1Click(Sender: TObject);
begin
  Form4.Show;
  Form3.Close;
end;

procedure TForm3.Laporan1Click(Sender: TObject);
begin
  Form6.Show;
  Form3.Close;
end;

procedure TForm3.Edit6Change(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from datapasien where nama_pasien like "%'+Edit6.Text+'%" or no_rm like "'+Edit6.Text+'%"');
  ADOQuery1.Open;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
    frxreport1.ShowReport();
end;

end.
