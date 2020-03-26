procedure delete(var head,tail:Plist);
var
 help:Plist;
begin
  if head^.next<>nil then
    while head<>tail do
       begin
         help:=head;
         head:=head^.next;
         dispose(help);
       end;    
  dispose(head); 
  head:=nil;
  tail:=nil;
end;
