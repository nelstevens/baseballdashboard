# make_league_sidebar works

    Code
      make_league_sidebar("test")
    Output
      <li class="treeview">
        <a href="#shiny-tab-test">
          <i class="fa fa-baseball-ball" role="presentation" aria-label="baseball-ball icon"></i>
          <span>TEST</span>
          <i class="fa fa-angle-left pull-right" role="presentation" aria-label="angle-left icon"></i>
        </a>
        <ul class="treeview-menu" style="display: none;" data-expanded="TEST">
          <li>
            <a href="#shiny-tab-offense-test" data-toggle="tab" data-value="offense-test">
              <i class="fa fa-utensils" role="presentation" aria-label="utensils icon"></i>
              Offense
            </a>
          </li>
          <li>
            <a href="#shiny-tab-defense-test" data-toggle="tab" data-value="defense-test">
              <i class="fa fa-mitten" role="presentation" aria-label="mitten icon"></i>
              Defense
            </a>
          </li>
          <li>
            <a href="#shiny-tab-pitching-test" data-toggle="tab" data-value="pitching-test">
              <i class="fa fa-baseball-ball" role="presentation" aria-label="baseball-ball icon"></i>
              Pitching
            </a>
          </li>
        </ul>
      </li>

---

    Code
      make_league_sidebar("test", expanded = TRUE)
    Output
      <li class="treeview">
        <a href="#shiny-tab-test">
          <i class="fa fa-baseball-ball" role="presentation" aria-label="baseball-ball icon"></i>
          <span>TEST</span>
          <i class="fa fa-angle-left pull-right" role="presentation" aria-label="angle-left icon"></i>
        </a>
        <ul class="treeview-menu menu-open" style="display: block;" data-expanded="TEST">
          <li>
            <a href="#shiny-tab-offense-test" data-toggle="tab" data-value="offense-test">
              <i class="fa fa-utensils" role="presentation" aria-label="utensils icon"></i>
              Offense
            </a>
          </li>
          <li>
            <a href="#shiny-tab-defense-test" data-toggle="tab" data-value="defense-test">
              <i class="fa fa-mitten" role="presentation" aria-label="mitten icon"></i>
              Defense
            </a>
          </li>
          <li>
            <a href="#shiny-tab-pitching-test" data-toggle="tab" data-value="pitching-test">
              <i class="fa fa-baseball-ball" role="presentation" aria-label="baseball-ball icon"></i>
              Pitching
            </a>
          </li>
        </ul>
      </li>

# get_relpicker works

    Code
      get_relpicker("offense")
    Output
      [1] "R"     "H"     "RBI"   "Sngls" "Dbls"  "Trpls" "HR"    "HBP"   "SO"   

---

    Code
      get_relpicker("defense")
    Output
      [1] "Assists" "Putouts" "Errors"  "DP"     

