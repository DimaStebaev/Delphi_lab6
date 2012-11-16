unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LongEdit;

type
  TForm1 = class(TForm)

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure MyChange(Sender: TObject);


  private
    procedure Resize;
  public
    my : TLongEdit;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
my := TLongEdit.Create(self);
my.OnChange := MyChange;
my.Parent:=self;
resize;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
my.free;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
//resize;
end;

procedure TForm1.Resize;
begin
my.Top := (self.ClientHeight - my.Height) div 2;
if(my.Width >= self.ClientWidth) then
begin
    my.Left := 0;
    self.ClientWidth := my.Width;
end else
    my.Left := (self.ClientWidth - my.Width) div 2;
end;

procedure TForm1.MyChange(Sender: TObject);
begin
    //resize;
end;

end.
