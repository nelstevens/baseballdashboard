# laod all
devtools::load_all()

# get 2021 VR offense
VR21off <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense
PL21off <- getApi("stats/Stats_Static.asmx/off", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))

# get 2021 VR def
VR21fld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 53, Splits = "", IndOrTeam = "Individual"))
# get 2021 PL offense
PL21fld <- getApi("stats/Stats_Static.asmx/fld", list(Year = 2021, League = 83, Round = 303, Splits = "", IndOrTeam = "Individual"))
