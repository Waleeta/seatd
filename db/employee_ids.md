"Duke"
1
"Ellie"
2
"Alyssa"
3
"Avner"
4
"Matt"
5
"Pete"
6
"Jones"
7
"Molly"
8
"Rachel"
9
"Katie"
10
"Jeff"
11
"Ken"
12
"Naomi"
13
"Bobby Gervais"
14
"Nick"
15
"West"
16
"Emily"
17
"Nick"
18
"Justin"
19
"Waleeta"
20
"Sam"
21
"Em"
22
"Noah Guy"
23
"Tyler"
24
"Erin"
25

def service_employees
service_employees = Service.all
service_employees.each do |service|
p service.service_type
p service.employee_id
end
end
