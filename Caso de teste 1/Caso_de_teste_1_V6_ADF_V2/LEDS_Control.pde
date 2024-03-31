//************************* LED ****** liga/desliga ***************//
void Acionamento_LEDs(int LED_numero, char comando)
{
  //char ledPinState = Serial.read();   //read the value
  println("Comando LED: "+LED_numero+" comando: "+ comando);
  switch (LED_numero) {
  case 0:

    if (comando == '1') {//Liga LED 0
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 0
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);      

    }

    delay(40);
    serialFlush();
    break;

  case 1:

    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);      

    }

    delay(40);
    serialFlush();
    break;
  case 2:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      // arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 3:

    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);     
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);      

    }
    delay(40);
    serialFlush();
    break;
  case 4:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      // arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 5:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 6:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 7:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 8:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 9:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 10:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 11:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 12:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 13:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 14:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;
  case 15:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      //arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_4, Arduino.LOW);     

    }
    delay(40);
    serialFlush();
    break;

  case 30:
    //Acerto();
    Acerto_Op_2();
    break;
  case 31:
    Acerto();
    break;
  case 32:
    Acerto_Op_3();
    break;
  default:
    int a = 0;
    break;
  }
}


//************************* LED ****** liga/desliga ***************//
void Acionamento_LEDs_OP2(int LED_numero, char comando)
{
  //char ledPinState = Serial.read();   //read the value
  println("Comando LED: "+LED_numero+" comando: "+ comando);
  switch (LED_numero) {
  case 0:

    if (comando == '1') {//Liga LED 0
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 0
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }

    delay(40);
    serialFlush();
    break;

  case 1:

    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);     
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);     
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }

    delay(40);
    serialFlush();
    break;
  case 2:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      // arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 3:

    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);     
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);     
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 4:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      // arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 5:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 6:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      // arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 7:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      // arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 8:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 9:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 10:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 11:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 12:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 13:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 14:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;
  case 15:
    if (comando == '1') {//Liga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_2, Arduino.HIGH);    
      arduino.digitalWrite(ledPin_3, Arduino.HIGH);      
      arduino.digitalWrite(ledPin_4, Arduino.HIGH);      
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    } else { //desliga LED 1
      arduino.digitalWrite(ledPin_1, Arduino.LOW);      
      arduino.digitalWrite(ledPin_2, Arduino.LOW);      
      arduino.digitalWrite(ledPin_3, Arduino.LOW);      
      arduino.digitalWrite(ledPin_4, Arduino.LOW);     
      //arduino.digitalWrite(ledPin_5, Arduino.LOW);
    }
    delay(40);
    serialFlush();
    break;

  case 30:
    //Acerto();
    Acerto_Op_2();
    break;
  case 31:
    Acerto();
    break;
  case 32:
    Acerto_Op_3();
    break;
  default:
    int a = 0;
    break;
  }
}
