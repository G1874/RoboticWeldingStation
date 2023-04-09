1 'Reset wyjsc
2 M_Out(14) = 0
3 M_Out(15) = 0
4 'Pozycja poczatkowa
5 Mov P0
6 'Oczekiwanie na sygnal rozpoczecia spawania elementy
7 M_Out(15) = 1       'Sygnal gotowosci robota do spawania
8 Wait M_In(11) = 1   'Oczekiwanie na sygnal rozpoczecia spawania prawej strony
9 M_Out(15) = 0
10 'Przypisanie punktów
11 Select M_In(12)
12     Case 1
13         Ph1 = P0
14         Ph2 = P0
15         Ph2.Y = Ph2.Y + 300
16         Pp1 = P1
17         Pp2 = P2
18         Pl1 = P3
19         Pl2 = P4
20     Break
21     Case 0
22         Ph1 = P0
23         Ph2 = P0
24         Ph1.Y = Ph1.Y - 300
25         Pp1 = P7
26         Pp2 = P8
27         Pl1 = P5
28         Pl2 = P6
29 End Select
30 'Spawanie - prawa strona
31 Mov Ph1
32 Mov Pp1,-100
33 Dly 0.1
34 Mov Pp1
35 Dly 0.1
36 Spd 70
37 Mvs Pp2
38 Dly 0.1
39 Mov Pp2,-10
40 Mov Ph1
41 M_Out(14) = 1       'Sygnal zakonczenia spawania prawej strony
42 Wait M_In(13) = 1   'Oczekiwanie na sygnal rozpoczecia spawania lewej strony
43 M_Out(14) = 0
44 'Spawanie - lewa strona
45 Mov Ph2
46 Mov Pl1,-100
47 Dly 0.1
48 Mov Pl1
49 Dly 0.1
50 Spd 50
51 Mvs Pl2
52 Dly 0.1
53 Mov Pl2,-100
54 Mov Ph2
P0=(+200.00,+0.00,+300.00,-180.00,+0.00,-90.00)(7,0)
Ph1=(+200.00,-300.00,+300.00,-180.00,+0.00,-90.00)(7,0)
Ph2=(+200.00,+0.00,+300.00,-180.00,+0.00,-90.00)(7,0)
Pp1=(+400.00,-220.00,+235.00,-140.00,+0.00,+0.00)(7,0)
P1=(+400.00,+150.00,+235.00,-150.00,+0.00,+0.00)(7,0)
Pp2=(+600.00,-220.00,+235.00,-150.00,+0.00,+0.00)(7,0)
P2=(+600.00,+150.00,+235.00,-150.00,+0.00,+0.00)(7,0)
Pl1=(+400.00,-200.00,+235.00,-150.00,+0.00,-180.00)(7,0)
P3=(+400.00,+180.00,+235.00,-140.00,+0.00,-180.00)(7,0)
Pl2=(+600.00,-200.00,+235.00,-150.00,+0.00,-180.00)(7,0)
P4=(+600.00,+180.00,+235.00,-150.00,+0.00,-180.00)(7,0)
P7=(+400.00,-220.00,+235.00,-140.00,+0.00,+0.00)(7,0)
P8=(+600.00,-220.00,+235.00,-150.00,+0.00,+0.00)(7,0)
P5=(+400.00,-200.00,+235.00,-150.00,+0.00,-180.00)(7,0)
P6=(+600.00,-200.00,+235.00,-150.00,+0.00,-180.00)(7,0)
Pt1=(+200.00,+300.00,+300.00,-180.00,+0.00,-90.00)(7,0)
Pt2=(+200.00,-300.00,+300.00,-180.00,+0.00,-90.00)(7,0)
