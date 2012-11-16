unit LongEdit;

interface

uses Classes, StdCtrls, Graphics;

type
  TLongEdit = class(TEdit)
  private
    bm: TBitMap;
  protected
    procedure Change; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
end;

implementation

{ TLongEdit }

procedure TLongEdit.Change;
var
nwidth: integer;
begin
inherited Change;

bm.Canvas.Font := Font;
if length(Text)=0 then
  nWidth := bm.Canvas.TextWidth('ww')
else
  nWidth := bm.Canvas.TextWidth(Text+'ww');

if (nwidth>width)and (parent<>nil) and (width+left+5 > parent.ClientWidth) then
  exit;

width := nwidth;
end;

constructor TLongEdit.Create(AOwner: TComponent);
begin
  inherited;
  bm := TBitmap.Create;
  Change;
end;

destructor TLongEdit.Destroy;
begin
  bm.Free;
  inherited;
end;

end.
