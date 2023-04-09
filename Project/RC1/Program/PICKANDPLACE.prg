1 Servo On
2 'Wyjscia 11-13 - do robota spawajacego
3 'Wejscia 14-15 - z robota spawajacego
4 'Wyjscia 21-32 - widocznosc plaskowników A
5 'Wyjscia 33-45 - widocznosc plaskowników B
6 'Reset wizualizacji
7 For M1 = 21 To 45
8 M_Out(M1) = 0
9 Next M1
10 Tool 1
11 'Inicjalizacja zmiennych
12 P5 = P3
13 P8 = P6
14 P5.Y = P5.Y - 75
15 P8.Y = P8.Y - 75
16 Ph1 = P9
17 Ph1.Y = Ph1.Y + 200
18 Ph1.C = 70
19 Ph2 = P8
20 Ph2.X = Ph2.X - 200
21 Ph3 = P5
22 Ph3.X = Ph3.X - 300
23 M3 = 0
24 Accel 90,90
25 'Reset wyjsc
26 M_Out(11) = 0
27 M_Out(12) = 0
28 M_Out(13) = 0
29 HOpen 1
30 'Petla glówna
31 For M2 = 0 To 8
32     'Przypisanie punktów
33     Select M3
34     Case 0
35         Pt1 = P3
36         Pt2 = P4
37         Pt3 = P5
38         M3 = 1
39     Break
40     Case 1
41         Pt1 = P6
42         Pt2 = P7
43         Pt3 = P8
44         M3 = 0
45     End Select
46     'Przeniesienie zespawanego zespolu na tasmociag
47     If M2 > 1 Then
48         M_Out(21) = 0
49         M_Out(45) = 0
50         Mov Pt3,-300
51         Mov Pt3
52         HClose 1
53         Tool 4
54         M_Out(23 - M3) = 0
55         M_Out(43 + M3) = 0
56         Select M3
57             Case 0
58                 Mov Pt3,-300
59                 Mvs Ph2,-300
60                 Mvs Ph1,-50
61                 Mov P9,-50
62                 Accel 30,30
63                 Mvs P9
64                 Accel 90,90
65             Break
66             Case 1
67                 Mov Pt3,-300
68                 Mov P9,-50
69                 Accel 30,30
70                 Mvs P9
71                 Accel 90,90
72         End Select
73         HOpen 1
74         Tool 1
75         M_Out(21) = 1
76         M_Out(45) = 1
77         Mov P9,-50
78         Mvs Ph1,-50
79         Mov Ph3,-200
80         Mvs P0
81     EndIf
82     'Zabranie pierwszego elementu z palety
83     Mov P0
84     Mvs P1
85     Dly 0.1
86     Mvs P1,20+50*M2
87     Dly 0.1
88     HClose 1
89     Tool 2
90     M_Out(24+M2) = 1
91     Mvs P1,50*M2
92     Mvs P0,50*M2
93     Mvs P0
94     'Polozenie pierwszego elementu na stole roboczym
95     If M3 Then Mov Ph3,-200
96     Mov Pt1,-200
97     Dly 0.1
98     Accel 30,30
99     Mvs Pt1
100     Accel 90,90
101     Dly 0.1
102     HOpen 1
103     Tool 1
104     M_Out(23-M3) = 1
105     Mvs Pt1,-200
106     If M3 Then Mov Ph3,-200
107     Mov P0
108     'Zabranie drugiego elementu z palety
109     Mvs P2
110     Dly 0.1
111     Mvs P2,20+50*M2
112     Dly 0.1
113     HClose 1
114     Tool 3
115     M_Out(33+M2) = 1
116     Mvs P2,50*M2
117     Mvs P0,50*M2
118     Mvs P0
119     'Przytrzymanie drugiego elementu w pozycji do spawania
120     If M3 Then Mvs Ph3,-200
121     Mov Pt2
122     Wait M_In(15) = 1   'Oczekiwanie na sygnal gotowosci robota do spawania
123     Dly 0.1
124     Pt2.Z = Pt2.Z - 100
125     Accel 30,30
126     Mvs Pt2
127     Accel 90,90
128     M_Out(13) = 0       'Reset sygnalu spawania lewej strony
129     M_Out(12) = M3      'Sygnal przekazujacy pozycje elementu spawanego
130     M_Out(11) = 1       'Sygnal rozpoczecia spawania prawej strony
131     'Puszczenie drugiego elementu
132     Wait M_In(14) = 1   'Oczekiwanie na sygnal zakonczenia spawania prawej strony
133     M_Out(11) = 0
134     HOpen 1
135     Tool 1
136     M_Out(43+M3) = 1
137     Mvs Pt2,-10
138     Dly 0.1
139     Pt2.Z = Pt2.Z + 200
140     Mvs Pt2
141     Mov P0
142     M_Out(13) = 1       'Sygnal rozpoczecia spawania lewej strony
143 Next M2
144 'Przeniesienie ostatnich dwóch zespawanych zespolów na tasmociag
145 Wait M_In(15) = 1
146 'lewa
147 M_Out(21) = 0
148 M_Out(45) = 0
149 Mov P5,-300
150 Mov P5
151 HClose 1
152 Tool 4
153 M_Out(22) = 0
154 M_Out(44) = 0
155 Mov P5,-300
156 Mov P9,-50
157 Accel 30,30
158 Mvs P9
159 Accel 90,90
160 HOpen 1
161 Tool 1
162 Mov P9,-50
163 Mvs Ph1,-50
164 Mov Ph3,-200
165 'prawa
166 M_Out(21) = 0
167 M_Out(45) = 0
168 Mov P8,-300
169 Mov P8
170 HClose 1
171 Tool 4
172 M_Out(23) = 0
173 M_Out(43) = 0
174 Mov P8,-300
175 Mov P9,-50
176 Accel 30,30
177 Mvs P9
178 Accel 90,90
179 HOpen 1
180 Tool 1
181 Mov P9,-50
182 Mvs Ph1,-50
183 Mov Ph3,-200
184 Mvs P0
185 Servo Off
P5=(+550.00,-75.00,+220.00,+180.00,+0.00,+90.00)(7,0)
P3=(+550.00,+0.00,+220.00,+180.00,+0.00,+90.00)(7,0)
P8=(+550.00,+285.00,+220.00,+180.00,+0.00,+90.00)(7,0)
P6=(+550.00,+360.00,+220.00,+180.00,+0.00,+90.00)(7,0)
Ph1=(+200.00,-400.00,+368.00,+180.00,+0.00,+4010.70)(7,0)
P9=(+200.00,-600.00,+368.00,+180.00,+0.00,+0.00)(7,0)
Ph2=(+350.00,+285.00,+220.00,+180.00,+0.00,+90.00)(7,0)
Ph3=(+250.00,-75.00,+220.00,+180.00,+0.00,+90.00)(7,0)
Pt1=(+550.00,+0.00,+220.00,+180.00,+0.00,+90.00)(7,0)
Pt2=(+550.00,+10.00,+420.00,+90.00,+0.00,+180.00)(7,0)
P4=(+550.00,+10.00,+420.00,+90.00,+0.00,+180.00)(7,0)
Pt3=(+550.00,-75.00,+220.00,+180.00,+0.00,+90.00)(7,0)
P7=(+550.00,+370.00,+420.00,+90.00,+0.00,+180.00)(7,0)
P0=(+100.00,+400.00,+480.00,+180.00,+0.00,+180.00)(7,0)
P1=(-260.00,+445.00,+480.00,+180.00,+0.00,+180.00)(7,0)
P2=(+0.00,+630.00,+480.00,+180.00,+0.00,+180.00)(7,0)
