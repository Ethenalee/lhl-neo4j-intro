// genre nodes
CREATE (Action:Genre {name:'Action'})
CREATE (SciFi:Genre {name:'Science Fiction'})
CREATE (Drama:Genre {name:'Drama'})
CREATE (Thriller:Genre {name:'Thriller'})
CREATE (Mystery:Genre {name:'Mystery'})

// --------------------------------------------------------------------------------------------------------------

CREATE (TheMatrix:Movie {title:'The Matrix', released:1999, tagline:'Welcome to the Real World'})
CREATE (Keanu:Person {name:'Keanu Reeves', born:1964})
CREATE (Carrie:Person {name:'Carrie-Anne Moss', born:1967})
CREATE (Laurence:Person {name:'Laurence Fishburne', born:1961})
CREATE (Hugo:Person {name:'Hugo Weaving', born:1960})
CREATE (LillyW:Person {name:'Lilly Wachowski', born:1967})
CREATE (LanaW:Person {name:'Lana Wachowski', born:1965})
CREATE (JoelS:Person {name:'Joel Silver', born:1952})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrix),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrix),
  (LillyW)-[:DIRECTED]->(TheMatrix),
  (LanaW)-[:DIRECTED]->(TheMatrix),
  (JoelS)-[:PRODUCED]->(TheMatrix)

CREATE (Emil:Person {name:"Emil Eifrem", born:1978})
CREATE (Emil)-[:ACTED_IN {roles:["Emil"]}]->(TheMatrix)

CREATE (TheMatrixReloaded:Movie {title:'The Matrix Reloaded', released:2003, tagline:'Free your mind'})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrixReloaded),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrixReloaded),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrixReloaded),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrixReloaded),
  (LillyW)-[:DIRECTED]->(TheMatrixReloaded),
  (LanaW)-[:DIRECTED]->(TheMatrixReloaded),
  (JoelS)-[:PRODUCED]->(TheMatrixReloaded)

CREATE (TheMatrixRevolutions:Movie {title:'The Matrix Revolutions', released:2003, tagline:'Everything that has a beginning has an end'})
CREATE
  (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrixRevolutions),
  (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrixRevolutions),
  (Laurence)-[:ACTED_IN {roles:['Morpheus']}]->(TheMatrixRevolutions),
  (Hugo)-[:ACTED_IN {roles:['Agent Smith']}]->(TheMatrixRevolutions),
  (LillyW)-[:DIRECTED]->(TheMatrixRevolutions),
  (LanaW)-[:DIRECTED]->(TheMatrixRevolutions),
  (JoelS)-[:PRODUCED]->(TheMatrixRevolutions)

// more person nodes (reviewers)
CREATE (Reviewer1:Person {name:'Jane Doe'})
CREATE (Reviewer2:Person {name:'John Doe'})
CREATE (Reviewer3:Person {name:'Sara J.'})
CREATE (Reviewer4:Person {name:'Emily'})

CREATE
  (Reviewer3)-[:IS_FRIENDS_WITH]->(Reviewer4),
  (Reviewer1)-[:IS_FRIENDS_WITH]->(Reviewer3),
  (Reviewer1)-[:IS_FRIENDS_WITH]->(Reviewer4),
  (Reviewer1)-[:IS_FRIENDS_WITH]->(Reviewer2),
  (Reviewer2)-[:IS_FRIENDS_WITH]->(Reviewer4),

// relationships of people to the movies, The Matrix
CREATE
  (Reviewer1)-[:REVIEWED {rating: 4, comment: 'Awesome movie'}]->(TheMatrix),
  (Reviewer2)-[:REVIEWED {rating: 5, comment: 'Was glued to my seat the whole time'}]->(TheMatrix),
  (Reviewer3)-[:REVIEWED {rating: 1, comment: 'I didn\'t get it'}]->(TheMatrix),
  (Reviewer2)-[:REVIEWED {rating: 4, comment: 'very cool!'}]->(TheMatrixReloaded),
  (Reviewer3)-[:REVIEWED {rating: 3, comment: 'I get it'}]->(TheMatrixReloaded),
  (Reviewer3)-[:REVIEWED {rating: 5, comment: 'I can see'}]->(TheMatrixRevolutions)

// relationships of The Matrix to Genre types
CREATE
  (TheMatrix)-[:HAS_GENRE]->(SciFi),
  (TheMatrix)-[:HAS_GENRE]->(Action),
  (TheMatrixReloaded)-[:HAS_GENRE]->(SciFi),
  (TheMatrixReloaded)-[:HAS_GENRE]->(Action),
  (TheMatrixRevolutions)-[:HAS_GENRE]->(Action),
  (TheMatrixRevolutions)-[:HAS_GENRE]->(Drama)