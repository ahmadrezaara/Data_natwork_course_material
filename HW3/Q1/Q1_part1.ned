package hw3_q1.simulations;

import inet.node.ethernet.Eth10M;
import inet.node.ethernet.EthernetHost;
import inet.node.ethernet.EthernetHub;
import inet.showcases.wireless.sensornetwork.ManetSensorNode;


@license(LGPL);
//
// TODO documentation
//
network Ethernet_network
{
    @display("bgb=739,591");
    submodules:
        ethernetHub: EthernetHub {
            @display("p=352,271");
        }
        ethernetHost3: EthernetHost {
            @display("p=352,68");
        }
        ethernetHost2: EthernetHost {
            @display("p=178,129");
        }
        ethernetHost1: EthernetHost {
            @display("p=90,273");
        }
        ethernetHost8: EthernetHost {
            @display("p=178,431");
        }
        ethernetHost7: EthernetHost {
            @display("p=352,509");
        }
        ethernetHost6: EthernetHost {
            @display("p=530,431");
        }
        ethernetHost5: EthernetHost {
            @display("p=569,271");
        }
        ethernetHost4: EthernetHost {
            @display("p=530,129");
        }
    connections:
        ethernetHost3.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost2.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost1.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost8.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost7.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost6.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost5.ethg <--> Eth10M <--> ethernetHub.ethg++;
        ethernetHost4.ethg <--> Eth10M <--> ethernetHub.ethg++;
}

