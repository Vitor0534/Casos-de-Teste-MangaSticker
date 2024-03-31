import processing.serial.*;
import processing.sound.*;
import cc.arduino.*;

/*
    
 erros: Por algum motivo a execução do audio impede que o background mude. no caso, o background muda somente após a execução do audio
 (caso tenha algum audio envolvido), isso ocorre não importe onde a localização do comando do background esteja. É como se o 
 comando do background fosse reconhecido, hignorado e executado somente após o final do áudio. Outras funções funcionam normal
 mente enquanto o audio está executando;
 -- erro resolvido, na verdade o arduino não interfere em nada, oq ocorre é que o processing
 é dependente da função Draw e somente muda o fundo ou desenha algo na tela a cada ciclo 
 do loop do draw. isso foi resolvido usand-se um switch case e uma variável contadora;
 -- o que acontece é que o programa fica preso nos loops de espera pelo fim dos audios 
 
 */

// Objeto Arduino
Arduino arduino;
//pinos do arduino a serem utilizados
int ledPin_1 = 2;    //define the LED pin
int ledPin_2 = 3;    //define the LED pin
int ledPin_3 = 4;    //define the LED pin
int ledPin_4 = 6;    //define the LED pin
//int ledPin_5 = 7;    //define the LED pin

int button_1 = 13;
int button_2 = 12;
int button_3 = 11;
int button_4 = 10;
int button_5 = 9;
int button_6 = 8;
int button_7 = 7;
int button_8 = 5;

// variáveis para áudios .mp3  ou .wav 
SoundFile file_1;
SoundFile file_2;
SoundFile file_3;
SoundFile file_4;

//ArrayList para audio das cenas
ArrayList<SoundFile> Sound_Cenas;
int numero_Cenas=4;

//arrayList para áudio com as perguntas
ArrayList<SoundFile> Sound_vector_Perguntas;
int numero_sons=6;


//arrayList para áudio com reforço positivo 
ArrayList<SoundFile> Sound_vector_Reforco_Erros;
ArrayList<SoundFile> Sound_vector_Reforco_Acertos;
ArrayList<SoundFile> Sound_vector_Reforco_Final;


//define name of the serial communication
Serial myPort;                  

// variáveis para imagens
PImage imagem1;
PImage imagem2;
PImage imagem3;
PImage imagem4;
PImage global_img;


//variável de tempo de transição das cenas
int transicao_LEDs = 1000;
int transicao_Audios = 1000;
int transicao_Cenas= 1000;


//Diretorios das pastas do programa
String Falas_historia_Path = "/Sounds/Character_Speech_Story/";
String Falas_Perguntas_Path = "/Sounds/Character_Speech_Questions/";
String Reforco_Positivo_Acertos_Path = "/Sounds/Positive_Reinforcement/Acertos/";
String Reforco_Positivo_Erros_Path = "/Sounds/Positive_Reinforcement/Erros/";
String Reforco_Positivo_Final_Path = "/Sounds/Positive_Reinforcement/Final/";




class Thread_Sound implements Runnable {
  Thread t;
  Thread_Sound(SoundFile file_1) {
    t = new Thread(this, "Thread");
    //System.out.println("Child thread: " + t);
    file_1.amp(1);
    file_1.rate(1);
    //t.start();
  }
  public void run() {
    try {
      //System.out.println("Child Thread");
      file_1.play();
      while (file_1.isPlaying()) {
      }
      Thread.sleep(50);
    } 
    catch (InterruptedException e) {
      System.out.println("The child thread is interrupted.");
    }
    System.out.println("Exiting the child thread");
  }
}



void setup()
{
  size(500, 500, P2D);

  //****configuração dos pinos do Arduino****// COM4: Arduino Fisico  COM6: Arduino Proteus

  arduino = new Arduino(this, "COM4", 57600); //Inicia o Arduino

  //initialize LED output
  arduino.pinMode(ledPin_1, Arduino.OUTPUT);
  arduino.pinMode(ledPin_2, Arduino.OUTPUT);
  arduino.pinMode(ledPin_3, Arduino.OUTPUT);
  arduino.pinMode(ledPin_4, Arduino.OUTPUT);
  //arduino.pinMode(ledPin_5, Arduino.OUTPUT);

  //define pinos para botões
  arduino.pinMode(button_1, Arduino.INPUT);
  arduino.pinMode(button_2, Arduino.INPUT);
  arduino.pinMode(button_3, Arduino.INPUT);
  arduino.pinMode(button_4, Arduino.INPUT);
  arduino.pinMode(button_5, Arduino.INPUT);
  arduino.pinMode(button_6, Arduino.INPUT_PULLUP);
  arduino.pinMode(button_7, Arduino.INPUT_PULLUP);
  arduino.pinMode(button_8, Arduino.INPUT_PULLUP);
  //**************************************************************************//

  //**********carregando imagens das cenas *******************//
  imagem1 = loadImage("/Quadros_Atividade_1/Q1.jpg");
  imagem2 = loadImage("/Quadros_Atividade_1/Q2.jpg");
  imagem3 = loadImage("/Quadros_Atividade_1/Q3.jpg");
  imagem4 = loadImage("/Quadros_Atividade_1/Q4.jpg");
  global_img=loadImage("/Quadros_Atividade_1/Q1.jpg");

  // redimencionando imagens 
  imagem1.resize(width, height);
  imagem2.resize(width, height);
  imagem3.resize(width, height);
  imagem4.resize(width, height);
  global_img.resize(width, height);

  //configurando Q1 como fundo inicial
  background(global_img);

  //************************************************************//


  //***** configurações da comunicação serial **** //
  System.out.println(Serial.list());
  //myPort=new Serial(this, Serial.list()[0], 9600);  //the name of our communication port (Arduino COM port)
  //frameRate(10);
  //*************************************************//


  //*************** configurando audios das cenas ********************//
  configura_Audios_cenas(Falas_historia_Path);


  //***** Configurações dos áudios das perguntas ****** //
  configura_Audios_Perguntas(Falas_Perguntas_Path);


  //************* configurando audios do reforço positivo ****************//
  
  //  String Reforco_Positivo_Acertos_Path = "/Sounds/Positive_Reinforcement/Acertos/";
  //String Reforco_Positivo_Erros_Path = "/Sounds/Positive_Reinforcement/Erros/";
  //String Reforco_Positivo_Final_Path = "/Sounds/Positive_Reinforcement/Final/";
  configura_Audios_Reforco_Positivo(Reforco_Positivo_Erros_Path, Reforco_Positivo_Acertos_Path, Reforco_Positivo_Final_Path);

}


void configura_Audios_cenas(String path)
{
  println("Carregando falas das cenas...");
  Sound_Cenas = new ArrayList<SoundFile>();
  Sound_Cenas.add(0, new SoundFile(this, path+"Fala_1_F.wav")); //apresentação personagem
  Sound_Cenas.add(1, new SoundFile(this, path+"Fala_2_F.wav")); //explicação da história
  Sound_Cenas.add(2, new SoundFile(this, path+"Fala_3_F.wav")); //dica sobre as notas
  Sound_Cenas.add(3, new SoundFile(this, path+"Fala_4_F_RS2.wav")); //R$2
  Sound_Cenas.add(4, new SoundFile(this, path+"Fala_5_F_RS5.wav")); //R$5
  Sound_Cenas.add(5, new SoundFile(this, path+"Fala_6_F_RS10.wav")); //R$10
  Sound_Cenas.add(6, new SoundFile(this, path+"Fala_7_F_RS20.wav")); //R$20
  Sound_Cenas.add(7, new SoundFile(this, path+"Fala_8_F_RS50.wav")); //R$50
  Sound_Cenas.add(8, new SoundFile(this, path+"Fala_9_F_RS100.wav")); //R$100
  Sound_Cenas.add(9, new SoundFile(this, path+"Fala_10_F_RS200.wav")); //R$200
  println("falas das cenas carregadas");
}

void configura_Audios_Perguntas(String path) {
  println("Carregando falas das perguntas...");
  Sound_vector_Perguntas = new ArrayList<SoundFile>();
  Sound_vector_Perguntas.add(0, new SoundFile(this, path+"P01Intro.wav")); //2
  Sound_vector_Perguntas.add(1, new SoundFile(this, path+"P2_RS_5.wav")); //5
  Sound_vector_Perguntas.add(2, new SoundFile(this, path+"P3_RS_10.wav")); //10
  Sound_vector_Perguntas.add(3, new SoundFile(this, path+"P4_RS_20.wav")); //20
  Sound_vector_Perguntas.add(4, new SoundFile(this, path+"P5_RS_50.wav")); //50
  Sound_vector_Perguntas.add(5, new SoundFile(this, path+"P6_RS_100.wav")); //100
  Sound_vector_Perguntas.add(6, new SoundFile(this, path+"P7_RS_200.wav")); //200
  println("falas das perguntas carregadas");
}

void configura_Audios_Reforco_Positivo(String Erros_Path, String Acertos_Path, String Final_Path)
{

  println("Carregando falas do reforço positivo...");
  // *** carregando audios de erros *****//
  Sound_vector_Reforco_Erros= new ArrayList<SoundFile>();
  Sound_vector_Reforco_Erros.add(0, new SoundFile(this, Erros_Path+"ERRO_1_Sound.wav"));
  Sound_vector_Reforco_Erros.add(1, new SoundFile(this, Erros_Path+"ERRO_2_Sound.wav"));
  Sound_vector_Reforco_Erros.add(2, new SoundFile(this, Erros_Path+"ERRO_3_Sound.wav"));
  println("      - Erros carregados;");
  // *** carregando audios de acertos ***//
  Sound_vector_Reforco_Acertos= new ArrayList<SoundFile>();
  Sound_vector_Reforco_Acertos.add(0, new SoundFile(this, Acertos_Path+"Acerto_1_Ap.wav"));
  Sound_vector_Reforco_Acertos.add(1, new SoundFile(this, Acertos_Path+"Acerto_2_Ap.wav"));
  Sound_vector_Reforco_Acertos.add(2, new SoundFile(this, Acertos_Path+"Acerto_3_Ap.wav"));
  println("      - Acertos carregados;");

  //**** carregando audios com falas de encerramento ******//
  Sound_vector_Reforco_Final = new ArrayList<SoundFile>();
  Sound_vector_Reforco_Final.add(0, new SoundFile(this, Final_Path+"Final_AP_1.wav"));
  Sound_vector_Reforco_Final.add(0, new SoundFile(this, Final_Path+"Final_AP_2.wav"));
  println("      - Falas finais carregadas;");
}



int play=1;
int cont = 0;
int cenas_cont=0;

void draw()
{

  // O processing é dependente da função draw, que é um loop infinito, no caso, para desenhar alguma coisa na tela
  // é necessário que seja completa uma rotina desta função,ou seja, a atualização do background é feito no fim da função
  // de modo que é necessário controlar as cenas para que o loop seja feito a cada mudança de cena
  // é para isso que serve o switch e o conta_cenas
  //Executa_Cena(int numero_audio, int numero_quadro, int cue, int numero_LED)
  //if (arduino.digitalRead(button_7) == Arduino.LOW)
  //veri_button();
  //if(arduino.digitalRead(button_8) == Arduino.LOW){
  //  Acionamento_LEDs(1, '1');
  //  //arduino.digitalWrite(button_8,1);
  //  println(arduino.digitalRead(button_8));
  //}
  //else{
  //  Acionamento_LEDs(1, '0');

  //  println(arduino.digitalRead(button_8));
  //}
//Acionamento_LEDs(32, '1');


  if (arduino.digitalRead(button_8) == Arduino.LOW|| play==0) {
    switch(cenas_cont) {
    case 0:
      play=0;
      muda_Cena(1);
      cenas_cont++;
      break;
    case 1:
      Executa_Cena(1, 1, 0, 0);
      muda_Cena(2);
      cenas_cont++;
      break;
    case 2:
      Executa_Cena(2, 2, 0, 1);
      muda_Cena(3);
      cenas_cont++;
      break;
    case 3:
      Executa_Cena(3, 3, 0, 2);
      muda_Cena(4);
      cenas_cont++;
      break;
    case 4:
      Executa_Cena(4, 3, 0, 2);
      muda_Cena(4);
      cenas_cont++;
      break;
    case 5:
      Executa_Cena(5, 3, 0, 3);
      muda_Cena(4);
      cenas_cont++;
      break;
    case 6:
      Executa_Cena(6, 3, 0, 4);
      muda_Cena(4);
      cenas_cont++;
      break;
    case 7:
      Executa_Cena(7, 3, 0, 5);
      muda_Cena(4);
      cenas_cont++;
      break;
    case 8:
      Executa_Cena(8, 3, 0, 6);
      muda_Cena(4);
      cenas_cont++;
      break;
    case 9:
      Executa_Cena(9, 3, 0, 7);
      muda_Cena(4);
      cenas_cont++;
      break;
    case 10:
      Executa_Cena(10, 3, 0, 14);
      muda_Cena(4);
      cenas_cont++;
      break;

    case 11:
      atividade_1();
      cenas_cont=1;
      play=1;
      break;
    }
  }
}


void veri_button()
{

  println("\n\n\nbutton[1]: " + arduino.digitalRead(button_1));
  println("button[2]: " + arduino.digitalRead(button_2));
  println("button[3]: " + arduino.digitalRead(button_3));
  println("button[4]: " + arduino.digitalRead(button_4));
  println("button[5]: " + arduino.digitalRead(button_5));
  println("button[6]: " + arduino.digitalRead(button_6));
  println("button[7]: " + arduino.digitalRead(button_7));
  println("button[8]: " + arduino.digitalRead(button_8));
} 
//void mousePressed()
//{
//  Cena_1();
//  muda_Cena(2);
//  Cena_2();
//  muda_Cena(3);
//  Cena_3();
//  muda_Cena(4);
//  //Cena_4();
//  //atividade_1();
//  //background(imagem1);
//  //file_1.play();
//  //file_1.amp(0.5);
//  //file_1.rate(L);
//}

void mousePressed()
{
  //Executa_Cena(int numero_audio,int numero_quadro,int cue, char comando_liga_led, char comando_desliga_led)
  play=1;
}




void muda_Cena(int cond)
{
  switch(cond) 
  {
  case 1:
    pushMatrix();
    background(imagem1);
    println("case 1");
    popMatrix();
    break;
  case 2:
    pushMatrix();
    background(imagem2);
    //delay(120000);
    //global_img=imagem2;
    println("case 2");
    popMatrix();
    break;
  case 3:
    pushMatrix();
    background(imagem3);
    //global_img=imagem3;
    println("case 3");
    popMatrix();
    break;
  case 4:
    background(imagem4);
    //global_img=imagem4;
    println("case 4");
    break;
  }
}


//função que permite o controle da passagem das cenas em cada estado do programa
// permite controle do audio em excução e dos comandos de ligar e desligar os LEDS

void Executa_Cena(int numero_audio, int numero_quadro, int cue, int numero_LED)
{

  println("Executa cena: " +  numero_audio+ "\nAudio: " + numero_audio + "\nLED: "+numero_LED);
  // Thread_Sound  sound = new Thread_Sound(file_1);

  //muda o quadro na tela do processing
  muda_Cena(numero_quadro);
  delay(1000);

  //liga o led referente a cena em questão
  //myPort.write(comando_liga_led);
  Acionamento_LEDs(numero_LED, '1');
  delay(2000);
  //executa o audio referente a cena em questão
  play_Sound(Sound_Cenas.get(numero_audio-1), cue, 1, 1, numero_LED);

  //desliga o led referente a cena em questão
  //myPort.write(comando_desliga_led);
  Acionamento_LEDs(numero_LED, '0');
  //muda_Cena(2);
  delay(2000);
  serialFlush();
}

void play_Sound(SoundFile audio, int cue, int amp, int rate, int numero_LED)
{

  audio.cue(cue);
  audio.play(amp, rate);

  //aguarda a execução do áudio
  while (audio.isPlaying())
  {
    //if(numero_LED >=2){
    //Acionamento_LEDs(numero_LED,'1');
    //delay(10);
    //Acionamento_LEDs(numero_LED+12,'1');
    //}
    delay(1000);
  }
  //Acionamento_LEDs(numero_LED,'1');
}

//Descrição: função que controla o fluxo das atividades, ela se basea no numer de perguntas, o numero
//           numero do LED para cada pergunta. as funções de fazer pergunta controlão os audios e LEDs a serem
//           acionado. uma vez que uma pergunta tenha sido respondida pelo user, por meio da função controle, a resposta
//           é retornada a função atividade que valida a mesma chamando a função de reforço positivo

void atividade_1()
{
  boolean resposta=false; // tratar pergunta de acordo com reforço positivo para acerto ou erro
  int cont=0;
  while (cont<8) {

    switch(cont) {
    case 0:
      resposta = Fazer_Pergunta(1, '1', 8);
      reforco_Positivo(resposta, 8, 0); 
      break;
    case 1:
      resposta = Fazer_Pergunta(2, '2', 9);
      reforco_Positivo(resposta, 9, 0); 
      break;
    case 2:
      resposta = Fazer_Pergunta(3, '3', 10);
      reforco_Positivo(resposta, 10, 0); 
      break;
    case 3:
      resposta = Fazer_Pergunta(4, '4', 11);
      reforco_Positivo(resposta, 11, 0); 
      break;
    case 4:
      resposta = Fazer_Pergunta(5, '5', 12);
      reforco_Positivo(resposta, 12, 0); 
      break;
    case 5:
      resposta = Fazer_Pergunta(6, '6', 13);
      reforco_Positivo(resposta, 13, 0); 
      break;
    case 6:
      resposta = Fazer_Pergunta(7, '7', 15);
      if (!resposta)
        reforco_Positivo(resposta, 15, 0); 
      break;
    case 7:
      reforco_Positivo(resposta, 0, 1);
      break;
    }

    if (resposta)
      cont++;
  }
}

// realiza a pergunta para o participante e retorna se ele acertou ou não
boolean Fazer_Pergunta(int numero_pergunta, char correcao, int numero_LED)
{
  int resposta;
  boolean veri=false;
  serialFlush();
  println("pergunta: " + numero_pergunta + " numero LED =" +  numero_LED);
  resposta = Pergunta(numero_pergunta, numero_LED);  // faz a pergunta 

  //se acertou
  if (resposta==correcao) {
    println("Resposta_"+ numero_pergunta+" : correta");
    background(0, 255, 0);

    Acionamento_LEDs(numero_LED, '0');
    veri=true;
    delay(60);
    serialFlush();
    Acionamento_LEDs(32, '1');
    delay(600);
  } else {//se errou

    println("Resposta_" + numero_pergunta+" : incorreta");
    background(255, 0, 0);
    //myPort.write('7');
    Acionamento_LEDs(numero_LED, '0');
    delay(60);
    serialFlush();
  }

  delay(40);
  serialFlush();
  return veri;
}


//executa o audio da pergunta e pega a resposta do participante 
//é subtraido 1 para bater com o número da pergunta 
int Pergunta(int numero, int numero_LED)
{

  //Sistema executa o áudio da primeira pergunta
  //muda_Cena(2);
  delay(1000);
  Sound_vector_Perguntas.get(numero-1).cue(0);
  Sound_vector_Perguntas.get(numero-1).play();

  //aciona LED referente a pergunta naquele momento
  //myPort.write('6');
  Acionamento_LEDs(numero_LED, '1');
  delay(5000);

  while (Sound_vector_Perguntas.get(numero-1).isPlaying())
  {
    delay(1000);
    //System.out.println("A");
  }

  // Sistema permanece em espera pela resposta do participante
  int Estado = controle(); //sede o controle ao participante para que ele responda a pergunta
  Acionamento_LEDs(numero_LED, '1');
  println("P1: Inseriu dado");
  println("Resposta: " + (Estado-30));
  //retorna a resposta
  return Estado;
}


// Descrição: função que implementa o reforço positivo, o qual consise de paraberns ou um convite
//            para o participante refazer o teste;
void reforco_Positivo(boolean resposta, int LED_Number, int veri_final)
{
  //play_Sound(SoundFile audio, int cue, int amp, int rate, int numero_LED)
  switch(veri_final) {
  case 0: //faz reforço normalmente
    if (resposta) { //reforço caso ocorra um acerto 
      println("Reforço positivo: ACERTO");
      Acionamento_LEDs(LED_Number, '1');
      play_Sound(Sound_vector_Reforco_Acertos.get(int(random(Sound_vector_Reforco_Acertos.size()))), 1, 1, 1, 20);
      Acionamento_LEDs(LED_Number, '0');
    } else {
      println("Reforço positivo: ERRO");
      Acionamento_LEDs(LED_Number, '1');
      play_Sound(Sound_vector_Reforco_Erros.get(int(random(Sound_vector_Reforco_Erros.size()))), 1, 1, 1, 20);
      Acionamento_LEDs(LED_Number, '0');
    }
    break;
  case 1: //faz o reforço do encerramento
    Acionamento_LEDs(LED_Number, '1');
    play_Sound(Sound_vector_Reforco_Final.get(int(random(Sound_vector_Reforco_Final.size()))), 1, 1, 1, 20);
    Acionamento_LEDs(LED_Number, '0');
    break;
  }
}


void serialFlush() {
  //while (myPort.available() > 0) {
  //int t = myPort.read();
  //}
  //delay(10);
} 


//somento um teste de troca de background
boolean veri=false;
void keyReleased() {
  if ( key =='a' || key=='A') {
    veri=true;
    background(imagem1);
  } else {
    if ( key =='d' || key=='D')
    {
      background(imagem2);
    } else {
      if ( key =='w' || key=='W')
      {
        background(imagem3);
      } else
      {
        if ( key =='s' || key=='S')
        {
          background(imagem4);
        }
      }
    }
  }
}


void Acerto()
{

  int cont = 0;
  while (cont <= 5) {
    arduino.digitalWrite(ledPin_1, Arduino.HIGH);       //turn ON the LED
    arduino.digitalWrite(ledPin_2, Arduino.HIGH);       //turn ON the LED
    arduino.digitalWrite(ledPin_3, Arduino.HIGH);       //turn ON the LED
    arduino.digitalWrite(ledPin_4, Arduino.HIGH);       //turn ON the LED

    delay(1000);

    arduino.digitalWrite(ledPin_1, Arduino.LOW);       //turn OFF the LED
    arduino.digitalWrite(ledPin_2, Arduino.LOW);       //turn OFF the LED
    arduino.digitalWrite(ledPin_3, Arduino.LOW);       //turn OFF the LED
    arduino.digitalWrite(ledPin_4, Arduino.LOW);       //turn OFF the LED
    delay(1000);
    cont++;
  }
}

void Acerto_Op_2()
{

  int cont = 0;
  while (cont <= 25) {
    Acionamento_LEDs(int(random(15)), '1');
    delay(40);
    Acionamento_LEDs(int(random(15)), '0');
    delay(40);
    cont++;
  }
}


void Acerto_Op_3()
{

  int cont = 0;
  while (cont <= 25) {

    for (int i=0; i<16; i++) {
      Acionamento_LEDs(i, '1');
      Acionamento_LEDs(i, '0');
    }
    cont++;
  }
}

//função que retorna a informação inserina nos botões/sensores no arduino
char controle()
{

  char valor;
  while (true) {
    delay(100);
    if (arduino.digitalRead(button_1) == Arduino.LOW) //2
    {
      Acionamento_LEDs(14, '1');
      delay(60);
      serialFlush();
      valor='1';
      break;
    } else
    {
      if (arduino.digitalRead(button_2) == Arduino.LOW) //5
      {
        Acionamento_LEDs(15, '1');
        delay(60);
        serialFlush();
        valor='2';
        break;
      } else {
        if (arduino.digitalRead(button_3) == Arduino.LOW)  //10
        {
          Acionamento_LEDs(16, '1');
          delay(60);
          serialFlush();
          valor='3';
          break;
        } else {
          if (arduino.digitalRead(button_4) == Arduino.LOW) //20
          {
            Acionamento_LEDs(17, '1');
            delay(60);
            serialFlush();
            valor='4';
            break;
          } else {
            if (arduino.digitalRead(button_5) == Arduino.LOW) //50
            {
              Acionamento_LEDs(18, '1');
              delay(60);
              serialFlush();
              valor='5';
              break;
            } else {
              if (arduino.digitalRead(button_6) == Arduino.LOW) //100
              {
                Acionamento_LEDs(19, '1');
                delay(60);
                serialFlush();
                valor='6';
                break;
              } else {
                if (arduino.digitalRead(button_7) == Arduino.LOW) //200
                {
                  Acionamento_LEDs(19, '1');
                  delay(60);
                  serialFlush();
                  valor='7';
                  break;
                }
              }
            }
          }
        }
      }
    }
  }

  return valor;
}
