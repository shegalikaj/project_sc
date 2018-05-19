pragma solidity ^0.4.22;


contract ICK 
{
    address owner; 
    mapping(string => address) courses;
    mapping(address => address) StudentPresenceList;
    constructor()public
        {
            owner = msg.sender; 
        }
    
    modifier onlyOwner()
        {
            require(owner == msg.sender);
            _;

        }
    //krijohet nga owneri kontrata e kursit perkates
    function addCourse(string _CourseName, string _ProfName)public onlyOwner
        {
            address newCourse = new Course(_CourseName, _ProfName);
            courses[_CourseName] = newCourse;
        }
    function getCourseAddr(string _CourseName) public view returns(address)
        {
            return courses[_CourseName];
        }
    //krijohet smart kontrata ku ka mu rujt prezenca ne kurs
    function addPresence(address _courseAddr) public onlyOwner
        {
            address newList = new StudentPresence(_courseAddr);
            StudentPresenceList[_courseAddr] = newList;
        
        }
    function getPresenceAddr(address _courseAddr) public view returns(address)
        {
            return StudentPresenceList[_courseAddr];
        }
    
}


contract Course //is Coursee
{   
    string public  CourseName;
    string public  ProfName;
    struct student
        {  
            string Sname;
            string Slastname;
            string Semail;
        }
    
    mapping (address => student) Students;
    constructor(string _CourseName, string _ProfName)public
        {   
            CourseName = _CourseName;
            ProfName = _ProfName;
        }
    //ketu bohet regjistrmi ne kurs
    function enrollinCourse(string _name, string  _lastname, string _email)public
        {
            Students[msg.sender] = student
                ({
                    Sname : _name,
                    Slastname :_lastname,
                    Semail : _email
                });
        }   
    function getStudent(address addrStudent) public view returns(string,string,string)
        {
            return(Students[addrStudent].Sname,Students[addrStudent].Slastname, Students[addrStudent].Semail);
        }
    
    function getstudentName(address addrStudent) public view returns(string)
        {
            return Students[addrStudent].Sname;
        }
    function getstudentLastname(address addrStudent) public view returns(string)
        {
            return Students[addrStudent].Slastname;
        }   
    function getStudentaddr() public view returns(address)
        { 
            return msg.sender;
        }

   
   
   
}

contract StudentPresence
{   
    
    address sAddr;
    address public cAddr;
    struct studentPresence
        {
            string name;
            string lastname;
            string presence;
        }
    mapping (address => mapping(address => studentPresence)) PresenceList;
    constructor(address _courseAddr)public
        {
            cAddr = _courseAddr; 
        }
    function Spresence(address _sAddr, string _presence) public
        {
            Course c = Course(cAddr);
            sAddr = _sAddr;
            PresenceList[cAddr][sAddr] = studentPresence
                ({
                    name : c.getstudentName(_sAddr),
                    lastname : c.getstudentLastname(_sAddr),
                    presence : _presence
            
                });

        }
    function getPresence(address _sAddr)public view returns(string, string, string)
        {
            return (PresenceList[cAddr][_sAddr].name, PresenceList[cAddr][_sAddr].lastname, PresenceList[cAddr][_sAddr].presence);
        }

    
}
