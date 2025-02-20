package hw3_q1_3.simulations;

import inet.applications.dhcp.DhcpServer;
import inet.applications.ethernet.EtherAppServer;
import inet.node.ethernet.Eth10M;
import inet.node.ethernet.EthernetHost;
import inet.node.ethernet.EthernetHub;
import inet.node.ethernet.EthernetSwitch;
import inet.node.gpsr.GpsrRouter;
import inet.node.inet.StandardHost;
import inet.physicallayer.wired.common.WireJunction;
import inet.tests.ethernet.EthernetHost2;
import inet.tutorials.protocol.ServerHost1;


@license(LGPL);
//
// TODO documentation
//
network MixedLAN
{
    @display("bgb=893,529,,,0");
    int k;
    submodules:
        ethernetSwitch: EthernetSwitch {
            @display("p=194,123");
            gates:
                ethg[parent.k+1];
        }
        Host[k]: EthernetHost {
            @display("p=194,23");
        }
        wireJunction2: WireJunction {
            @display("p=194,221");
        }
        wireJunction1: WireJunction {
            @display("p=91,221");
        }
        wireJunction3: WireJunction {
            @display("p=348,221");
        }
        wireJunction4: WireJunction {
            @display("p=467,221");
        }
        HostB1: EthernetHost {
            @display("p=91,326");
        }
        HostB2: EthernetHost {
            @display("p=348,124");
        }
        ethernetHub: EthernetHub {
            @display("p=467,326");
        }
        HostH1: EthernetHost {
            @display("p=382,404");
        }
        HostH2: EthernetHost {
            @display("p=465,404");
        }
        server: EthernetHost {
            @display("p=554,405;i=device/server");
        }
    connections:
        HostB1.ethg <--> Eth10M {  length = 10m; } <--> wireJunction1.port++;
        wireJunction2.port++ <--> Eth10M {  length = 1cm; } <--> ethernetSwitch.ethg[0];
        wireJunction2.port++ <--> Eth10M {  length = 20m; } <--> wireJunction1.port++;
        wireJunction2.port++ <--> Eth10M {  length = 20m; } <--> wireJunction3.port++;
        wireJunction3.port++ <--> Eth10M {  length = 10m; } <--> HostB2.ethg;
        wireJunction3.port++ <--> Eth10M {  length = 20m; } <--> wireJunction4.port++;
        wireJunction4.port++ <--> Eth10M {  length = 1cm; } <--> ethernetHub.ethg++;
        ethernetHub.ethg++ <--> Eth10M {  length = 10m; } <--> HostH1.ethg;
        ethernetHub.ethg++ <--> Eth10M {  length = 10m; } <--> HostH2.ethg;
        ethernetHub.ethg++ <--> Eth10M {  length = 10m; } <--> server.ethg;
        for i=1..k {
            Host[i-1].ethg <--> Eth10M {  length = 10m; } <--> ethernetSwitch.ethg[i];
        }

}

