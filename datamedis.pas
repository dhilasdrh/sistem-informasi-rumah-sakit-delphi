unit datamedis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, jpeg, ExtCtrls, ComCtrls, DateUtils,
  ADODB, DB, Menus, frxClass, frxDBSet, frxpngimage;

type
  TForm6 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    Image1: TImage;
    Image2: TImage;
    Panel1: TPanel;
    Search: TButton;
    Edit11: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    DBGrid2: TDBGrid;
    DateTimePicker1: TDateTimePicker;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label11: TLabel;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Back: TButton;
    MainMenu1: TMainMenu;
    Home1: TMenuItem;
    Registrasi1: TMenuItem;
    DataDokter: TMenuItem;
    RawatJalan1: TMenuItem;
    RawatInap1: TMenuItem;
    Laporan1: TMenuItem;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Edit10: TEdit;
    ComboBox1: TComboBox;
    Update: TButton;
    Save: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Add: TButton;
    Delete: TButton;
    Edit: TButton;
    frxDBDataset2: TfrxDBDataset;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    procedure Home1Click(Sender: TObject);
    procedure Registrasi1Click(Sender: TObject);
    procedure DataDokterClick(Sender: TObject);
    procedure RawatJalan1Click(Sender: TObject);
    procedure RawatInap1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure AddClick(Sender: TObject);
    procedure UpdateClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure Edit11Change(Sender: TObject);
    procedure SearchClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses login, registrasi, dokter, RawatJalan, pasien, DaftarPasien,
  DaftarDokter, Laporan;

{$R *.dfm}

procedure TForm6.Home1Click(Sender: TObject);
begin
  Form6.Close;
  Form1.Show;
end;

procedure TForm6.Registrasi1Click(Sender: TObject);
begin
  Form6.Close;
  Form3.Show;
end;

procedure TForm6.DataDokterClick(Sender: TObject);
begin
  Form6.Close;
  Form5.Show;
end;

procedure TForm6.RawatJalan1Click(Sender: TObject);
begin
  Form6.Close;
  Form9.Show;
end;

procedure TForm6.RawatInap1Click(Sender: TObject);
begin
  Form6.Close;
  Form4.Show;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
    DateTimePicker1.DateTime:=DateOf(today);
    Edit10.Text:='11-00-0'+IntToStr(ADOQuery1.recordcount+1); 
    Memo1.Clear;
    Memo2.Clear;
    Memo3.Clear;
    Memo4.Clear;
    update.Visible:=false;
    add.Enabled:=false;
    edit.Enabled:=false;
    delete.enabled:=false;
end;

procedure TForm6.Edit1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm6.Edit6Click(Sender: TObject);
begin
  Form7.Show;
end;

procedure TForm6.BackClick(Sender: TObject);
begin
  Form6.Close;
end;

procedure TForm6.SaveClick(Sender: TObject);
begin
    with ADOQuery1 do
    begin
        Open;
        Append;
        FieldByName('no_registrasi').AsString:=edit10.text;
        FieldByName('tgl_registrasi').AsDateTime:=DateTimePicker1.Date;
        FieldByName('no_rm').AsString:=edit1.text;
        FieldByName('nama_pasien').AsString:=edit2.text;
        FieldByName('jenis_kelamin').AsString:=edit3.text;
        FieldByName('umur').AsString:=edit4.text;      
        FieldByName('gol_darah').AsString:=edit5.text;
        FieldByName('poli').AsString:=ComboBox1.text;
        FieldByName('id_dokter').AsString:=edit6.text;
        FieldByName('nama_dokter').AsString:=edit7.Text;
        FieldByName('keluhan').AsString:=Memo1.text;
        FieldByName('pemeriksaan').AsString:=Memo2.text;
        FieldByName('diagnosa').AsString:=edit9.text;
        FieldByName('tindakan').AsString:=Memo3.text;
        FieldByName('resep').AsString:=Memo4.text;
        Post;
    end;
    MessageDlg('Data berhasil disimpan',mtInformation,[mbOK],0);
    save.Visible:=true;
    save.Enabled:=false;
    update.visible:=false;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm6.AddClick(Sender: TObject);
begin
    Edit10.Text:='11-00-0'+IntToStr(ADOQuery1.recordcount+1);
    edit1.Text:='';
    edit2.Text:='';
    edit3.Text:='';
    edit4.Text:='';
    edit5.Text:='';
    ComboBox1.Text:='';
    edit6.Text:='';
    edit7.Text:='';
    Memo1.Text:='';
    Memo2.Text:='';
    edit9.Text:='';
    Memo3.Text:='';
    Memo4.Text:='';

    save.visible:=true;
    save.Enabled:=true;
    update.visible:=false;
    add.enabled:=false;
    edit.enabled:=false;
    delete.enabled:=false;
end;

procedure TForm6.UpdateClick(Sender: TObject);
begin
    with ADOQuery1 do
    begin
        Open;
        Edit;
        FieldByName('no_registrasi').AsString:=edit10.text;
        FieldByName('tgl_registrasi').AsDateTime:=DateTimePicker1.Date;
        FieldByName('no_rm').AsString:=edit1.text;
        FieldByName('nama_pasien').AsString:=edit2.text;
        FieldByName('jenis_kelamin').AsString:=edit3.text;
        FieldByName('umur').AsString:=edit4.text;
        FieldByName('gol_darah').AsString:=edit5.text;
        FieldByName('poli').AsString:=ComboBox1.text;
        FieldByName('id_dokter').AsString:=edit6.text;
        FieldByName('nama_dokter').AsString:=edit7.Text;
        FieldByName('keluhan').AsString:=Memo1.text;
        FieldByName('pemeriksaan').AsString:=Memo2.text;
        FieldByName('diagnosa').AsString:=edit9.text;
        FieldByName('tindakan').AsString:=Memo3.text;
        FieldByName('resep').AsString:=Memo4.text;
        Post;
    end;
    MessageDlg('Data berhasil diedit',mtInformation,[mbOK],0);
    save.Visible:=false;
    update.Enabled:=true;
    update.visible:=true;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm6.EditClick(Sender: TObject);
begin
  with ADOQuery1 do
  begin
        edit10.Text:=FieldByName('no_registrasi').AsString;
        DateTimePicker1.Date:=FieldByName('tgl_registrasi').AsDateTime;
        edit1.Text:=FieldByName('no_rm').AsString;
        edit2.Text:=FieldByName('nama_pasien').AsString;
        edit3.Text:=FieldByName('jenis_kelamin').AsString;
        edit4.Text:=FieldByName('umur').AsString;
        edit5.Text:=FieldByName('gol_darah').AsString;
        ComboBox1.Text:=FieldByName('poli').AsString;
        edit6.Text:=FieldByName('id_dokter').AsString;
        edit7.Text:=FieldByName('nama_dokter').AsString;
        Memo1.Text:=FieldByName('keluhan').AsString;
        Memo2.Text:=FieldByName('pemeriksaan').AsString;
        edit9.Text:=FieldByName('diagnosa').AsString;
        Memo3.Text:=FieldByName('tindakan').AsString;
        Memo4.Text:=FieldByName('resep').AsString;
  end;

  save.Visible:=false;
  update.visible:=true;
  update.enabled:=true;
  add.enabled:=false;
  edit.enabled:=false;
  delete.enabled:=false;
end;

procedure TForm6.DeleteClick(Sender: TObject);
begin
    ADOQuery1.Open;    
    ADOQuery1.Delete;
    MessageDlg('Data berhasil dihapus',mtInformation,[mbOK],0);

    save.Visible:=true;
    update.visible:=false;
    save.enabled:=false;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm6.DBGrid2CellClick(Column: TColumn);
begin
  with ADOQuery1 do
  begin
        edit10.Text:=FieldByName('no_registrasi').AsString;
        DateTimePicker1.Date:=FieldByName('tgl_registrasi').AsDateTime;
        edit1.Text:=FieldByName('no_rm').AsString;
        edit2.Text:=FieldByName('nama_pasien').AsString;
        edit3.Text:=FieldByName('jenis_kelamin').AsString;
        edit4.Text:=FieldByName('umur').AsString;
        edit5.Text:=FieldByName('gol_darah').AsString;
        ComboBox1.Text:=FieldByName('poli').AsString;
        edit6.Text:=FieldByName('id_dokter').AsString;
        edit7.Text:=FieldByName('nama_dokter').AsString;
        Memo1.Text:=FieldByName('keluhan').AsString;
        Memo2.Text:=FieldByName('pemeriksaan').AsString;
        edit9.Text:=FieldByName('diagnosa').AsString;
        Memo3.Text:=FieldByName('tindakan').AsString;
        Memo4.Text:=FieldByName('resep').AsString;
  end;

    save.Visible:=true;
    save.Enabled:=false;
    update.visible:=false;
    add.enabled:=true;
    edit.enabled:=true;
    delete.enabled:=true;
end;

procedure TForm6.Edit11Change(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from rekam_medis where no_registrasi like "'+edit11.Text+'%" or no_rm like "'+edit11.Text+'%" or nama_pasien lik "'+edit11.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm6.SearchClick(Sender: TObject);
begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from rekam_medis where no_registrasi like "'+edit11.Text+'%" or no_rm like "'+edit11.Text+'%" or nama_pasien lik "'+edit11.Text+'%"');
    ADOQuery1.Open;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
    frxreport1.ShowReport();  
  end;

end.
