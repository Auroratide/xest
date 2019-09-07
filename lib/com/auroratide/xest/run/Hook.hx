package com.auroratide.xest.run;

enum Hook {
  BeforeEach(f:() -> Void);
  AfterEach(f:() -> Void);
}