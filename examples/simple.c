#include <rfb/rfb.h>

int main(int argc,char** argv)
{                                                                
  rfbScreenInfoPtr server=rfbGetScreen(&argc,argv,400,300,8,3,4);
  if(!server)
    return 1;
  server->frameBuffer=(char*)malloc(400*300*4);

  rfbInitServer(server);
  
  long usec = 1;

rfbRunEventLoop(server,-1,TRUE);//FALSE);

  while(rfbIsActive(server)) {
    //rfbProcessEvents(server, usec);
      
    for (int y = 0; y < 300; y++) 
      for (int x = 0; x < 400; x++)
        server->frameBuffer[(y * 400 + x) * 4] = rand() % 0xff;

    rfbMarkRectAsModified(server, 0, 0, 10000, 10000);
  }
 
  //rfbRunEventLoop(server,-1,FALSE);
  return(0);
}
