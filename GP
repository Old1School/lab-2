{Построить очередь, элементы которой — русские слова. Напечатать слово, входящее в очередь максимальное число раз.}

type
  PList = ^TList;
  Tlist = record
    data: string;
    next: PList;
    index: integer;
  end;


procedure zadanie(tail: PList; head: PList); 
begin
  while head <> tail do
  begin
    if head^.data = tail^.data then 
      tail^.index := tail^.index + 1; //Каждый раз когда встречается такое слово как tail мы добавлем к индексу tail +1 
    head:=head^.next; 
  end; 
end;


procedure sozdanie(var head, tail: PList); 
begin
  if head = nil then
    begin
      new(head);
      readln(head^.data);
      head^.next := nil;
      tail := head;
      head^.index := 1;
    end
  else
    begin
      new(tail^.next);
      tail := tail^.next;
      readln(tail^.data);
      tail^.index := 1;
      tail^.next := nil;
      zadanie(tail, head);
    end; 
end;

procedure vivodhead(head: Plist);
begin
  writeln(head^.data);
  if head^.next <> nil then
  vivodhead(head^.next);
end;

procedure uoi(head: Plist);
var
  p: Plist;
  k: integer;
begin
  k := 0;
  P:= nil;
  if head = nil then
    writeln('Такого элемента не нашлось')
  else
    begin
      while head <> nil do
        begin
          if head^.index > k then
            begin
              k := head^.index;
              p := head;
            end;
          head := head^.next;
        end;
      writeln(p^.data, '-это слово повторилось ', p^.index, ' раз!');
    end;
end;


var
  head, tail: PList;
  i, p: integer;

begin
  head := nil;
  tail := nil;
  writeln('Сколько элементов добавить в очередь?');
  readln(i);
  for p := 1 to i do
    sozdanie(head, tail);
  writeln;
  if head <> nil then
    vivodhead(head);//Вывоводим эту очередь начиная с головы
  writeln;
  uoi(head); 
  if head <>nil then   
end.


{Добавляем элементы в список. Далее выводим очередь начиная с головы и uoi ищет повторения слов. 
