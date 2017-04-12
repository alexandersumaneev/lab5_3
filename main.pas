(*
 * Project: lab5_3
 * User: alexa
 * Date: 12.04.2017
 *)
{$R+}
{$S+}
Type
    arr_type = array[1..1000010] Of longint;
    comparator = Function (a, b: longint): boolean;

Var
    n, i: longint;
    f1, f2: text;
    arr: arr_type;

Function comp1(a, b: longint): boolean;
Begin
    comp1 := a > b;
End;

Function comp2(a, b: longint): boolean;
Begin
    comp2 := a < b;
End;

procedure heapify(Var arr: arr_type; n: longint; i: longint; comp: comparator);
var
    temp, left, right, largest: longint;
begin
    left := 2 * i;
    right := 2 * i + 1;
    largest := i;
    if (left <= n) and comp(arr[left],arr[largest]) then
        largest := left;
    if(right <= n) and comp(arr[right],arr[largest])then
        largest := right;
    if largest <> i then
    begin
        temp := arr[i];
        arr[i] := arr[largest];
        arr[largest] := temp;
        heapify(arr,n,largest,comp);
    end;
end;


procedure build_heap(Var arr: arr_type; n: longint; comp: comparator);
begin
    for i:=trunc(n / 2) downto 1 do
        heapify(arr,n,i,comp)
end;


procedure heap_sort(Var arr: arr_type; n: longint; comp: comparator);
var
    heap_size, temp, i: longint;
begin
    heap_size := n;
    build_heap(arr,n,comp);
    for i:=n downto 1 do
    begin
        temp := arr[1];
        arr[1] := arr[i];
        arr[i] := temp;
        heap_size := heap_size - 1;
        heapify(arr,heap_size,1,comp);
    end;
end;


Begin
    assign(f1, 'input.txt');
    reset(f1);
    readln(f1, n);
    i := 1;
    While Not eof(f1) Do
    Begin
        Read(f1, arr[i]);
        i := i + 1;
    End;
    Close(f1);
    heap_sort(arr,n,@comp1);
    assign(f2, 'output.txt');
    Rewrite(f2);
    For i := 1 To n Do
    Begin
        Write(f2, arr[i], ' ');
    End;
    Close(f2);
End.
