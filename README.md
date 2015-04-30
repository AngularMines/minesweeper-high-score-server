# minesweeper-high-score-server

Base uri: https://still-sea-1226.herokuapp.com/

Path: get /scores
Response:  [
            {
              name: "clifftinee21",
              time: 553, 
              created_at: ""2015-04-30T05:17:07.541Z"
            },
            ...
          ]
          
          
Path: post /scores
Request data:  {
                  username: "sterify23",
                  score: 234
                }
Response: [
            {
              username: "sterify23",
              score: 234
            }
          ]
