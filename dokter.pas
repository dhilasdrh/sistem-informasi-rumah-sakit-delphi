unit dokter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, ComCtrls, DB, ADODB,
  DBCtrls, Mask, DateUtils, Menus, RpCon, RpConDS, RpDefine, RpRave,
  frxClass, frxDBSet;

type
  TForm5 = class(TForm)
    DataSource1: TDataSource;
    Image1: TImage;
    Panel1: TPanel;
    Search: TButton;
    Edit7: TEdit;
    Save2: TButton;
    DBGrid2: TDBGrid;
    Save: TButton;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    Image2: TImage;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Registrasi1: TMenuItem;
    DataDokter: TMenuItem;
    RawatJalan1: TMenuItem;
    RawatInap1: TMenuItem;
    RekamMedis: TMenuItem;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Edit: TButton;
    Delete: TButton;
    Add: TButton;
    procedure addClick(Sender: TObject);
    procedure deleteClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Save2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Home1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Registrasi1Click(Sender: TObject);
    procedure RawatJalan1Click(Sender: TObject);
    procedure RawatInap1Click(Sender: TObject);
    procedure RekamMedisClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses login, registrasi, RawatJalan, pasien, datamedis;

{$R *.dfm}

procedure TForm5.addClick(Sender: TObject);
begin
  edit1.Text:='DR-00'+IntToStr(ADOQuery1.recordcount+1);
  edit2.clear;
  edit3.clear;
  memo1.clear;
  edit4.clear;
  edit5.clear;
  combobox1.text:='';
  combobox2.text:='';

  Save.Visible:=true;
  Save2.Visible:=false;
  Save.Enabled:=true;
  add.enabled:=false;
  edit.Enabled:=false;
  delete.enabled:=false;
end;

procedure TForm5.deleteClick(Sender: TObject);
begin
  ADOQuery1.Open;
  ADOQuery1.Delete;
  MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);

  edit1.clear;
  edit2.clear;
  edit3.clear;
  memo1.clear;
  edit4.clear;
  edit5.clear;
  combobox1.text:='';
  combobox2.text:='';
end;

procedure TForm5.SaveClick(Sender: TObject);
begin
 with ADOQuery1 do
  begin
    Open;
    Append;
    FieldByName('ID_dokter').AsString:=edit1.Text;
    FieldByName('Nama_Dokter').AsString:=edit2.Text;
    FieldByName('tgl_lahir').AsString:=DateToStr(DateTimePicker1.Date);
    FieldByName('Umur').AsString:=edit3.Text;
    FieldByName('jenis_kelamin').AsString:=ComboBox1.Text;
    FieldByName('Alamat').AsString:=Memo1.Text;
    FieldByName('No_hp').AsString:=Edit4.Text;
    FieldByName('email').AsString:=Edit5.Text;
    FieldByName('spesialis').AsString:=ComboBox2.Text;
    Post;
  end;

  MessageDlg('Data berhasil disimpan',mtInformation,[mbOK],0);

  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
  Save2.Visible:=false;
  save.enabled:=false;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
    edit1.Text:='DR-00'+IntToStr(ADOQuery1.recordcount+1);
    Memo1.Text:='';

  edit2.clear;
  edit3.clear;
  edit4.clear;
  edit5.clear;
  combobox1.text:='';
  combobox2.text:='';
    
    Save2.Visible:=false;
    Save.Enabled:=true;
    Add.Enabled:=false;
    Edit.Enabled:=false;
    Delete.Enabled:=false;
end;

procedure TForm5.editClick(Sender: TObject);
begin
  Save.Visible:=false;
  Save2.Visible:=true;

  Save2.Enabled:=true;
  Add.Enabled:=false;
  Edit.Enabled:=false;
  Delete.Enabled:=false;
end;

procedure TForm5.SearchClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from datadokter where id_dokter like "'+edit7.text+'%" or nama_dokter like "%'+edit7.text+'%"');
  ADOQuery1.Open;

  save.enabled:=false;
  save2.enabled:=false;
  add.enabled:=true;
  edit.enabled:=true;
  delete.enabled:=true;
end;

procedure TForm5.DBGrid2CellClick(Column: TColumn);
begin
    Save.Enabled:=false;
    Add.Enabled:=true;
    Edit.Enabled:=true;
    Delete.Enabled:=true;

    with ADOQuery1 do
    begin
    Edit1.Text:= FieldByName('ID_dokter').AsString;
    Edit2.Text:= FieldByName('Nama_dokter').AsString;
    DateTimePicker1.Date:=FieldByName('tgl_lahir').AsDateTime;
    Edit3.Text:= FieldByName('umur').AsString;
    ComboBox1.Text:= FieldByName('jenis_kelamin').AsString;
    Memo1.Text:= FieldByName('alamat').AsString;
    Edit4.Text:= FieldByName('no_hp').AsString;
    Edit5.Text:= FieldByName('email').AsString;
    ComboBox2.Text:= FieldByName('spesialis').AsString;
    end;
end;

procedure TForm5.Save2Click(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    Open;
    Edit;
    FieldByName('ID_dokter').AsString:=edit1.Text;
    FieldByName('Nama_Dokter').AsString:=edit2.Text;
    FieldByName('tgl_lahir').AsString:=DateToStr(DateTimePicker1.Date);
    FieldByName('Umur').AsString:=edit3.Text;
    FieldByName('jenis_kelamin').AsString:=ComboBox1.Text;
    FieldByName('Alamat').AsString:=Memo1.Text;
    FieldByName('No_hp').AsString:=Edit4.Text;
    FieldByName('email').AsString:=Edit5.Text;
    FieldByName('spesialis').AsString:=ComboBox2.Text;
    Post;
  end;
  MessageDlg('Data berhasil diedit',mtInformation,[mbOK],0);
  
  Save.Visible:=true;
  Save.Visible:=false;
  Save2.Enabled:=false;
  Add.Enabled:=true;
  Edit.Enabled:=true;
  Delete.Enabled:=true;
end;

procedure TForm5.DateTimePicker1Change(Sender: TObject);
var umur, tl, ts: Integer;
begin
  tl := Yearof(now);
  ts := YearOf(DateTimePicker1.Date);
  umur := tl -ts;
  edit3.Text := IntToStr(umur);
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Form5.Close;
end;

procedure TForm5.Home1Click(Sender: TObject);
begin
  Form5.Close;
  Form1.Show;
end;

procedure TForm5.N1Click(Sender: TObject);
begin
    Form5.Show;
end;

procedure TForm5.Registrasi1Click(Sender: TObject);
begin
  Form5.Close;
  Form3.Show;
end;

procedure TForm5.RawatJalan1Click(Sender: TObject);
begin
  Form5.Close;
  Form9.Show;
end;

procedure TForm5.RawatInap1Click(Sender: TObject);
begin
  Form5.Close;
  Form4.Show;
end;

procedure TForm5.RekamMedisClick(Sender: TObject);
begin
  Form5.Close;
  Form6.Show;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

procedure TForm5.Edit7Change(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from datadokter where id_dokter like "'+edit7.text+'%" or nama_dokter like "%'+edit7.text+'%"');
  ADOQuery1.Open;
end;

end.
