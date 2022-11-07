using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GraphComponent : MonoBehaviour
{

    private Graph<Vector2, float> graph;
    private int MAX_X_LENGTH = 10;

    void graphGen()
    {
        graph = new Graph<Vector2, float>();   
    }

    void nodeGen()
    {
        var startpoint = new Vector2(0, 0);
        var endpoint = new Vector2((float)(MAX_X_LENGTH+1), 0);
        var start = new Node<Vector2>() { Value = startpoint, NodeColor = Color.black };        //Start and End Nodes
        var end = new Node<Vector2>() { Value = endpoint, NodeColor = Color.cyan };
        graph.Nodes.Add(start);
        graph.Nodes.Add(end);

        var finished = false;
        var count = 1;
        while (finished != true)
        {
            var nodeNumber = Random.Range(2,4);

            for(int i = 0; i < nodeNumber; i++)
            {
                var temp = new Vector2(count, Random.Range(-5,5));                                  //Range is Y-intercept, count is 'category'
                var node = new Node<Vector2>() { Value = temp, NodeColor = Color.cyan };
                graph.Nodes.Add(node);
            }

            if (count == MAX_X_LENGTH)
            {
                finished = true;
            }

           count++;
        }
    }

    void edgeGen()
    {
        foreach (var node in graph.Nodes)
        {
            /* var randomNode = Random.Range(0, graph.Nodes.Count);
            var edge = new Edge<float, Vector2>() { Value = 1.0f, From = node, To = graph.Nodes[randomNode], EdgeColor = Color.white};      // Randomly makes a connection from selected node to any other random node
            graph.Edges.Add(edge);*/                                                                                                   // Does this for each node, which is don x amount of times by the while loop
            if (node.Value.x == 0)                  //If the node is a starting node
            {
                var finished = false;
                while (finished != true)
                {

                }
            } else

            if (node.Value.x == (MAX_X_LENGTH+1))   //If the node is an ending node
            {
                var finished = false;
                while (finished != true)
                {

                }
            } else                                  //Rules for the rest of the nodes
            {

            }
        }
    }


   /* void graphGen()
    {
        graph = new Graph<Vector2, float>();
        
        /* Sample working graph code */
    /*  var startpoint = new Vector2(0, 0);
        var endpoint = new Vector2(10.0f, 0);

        var start = new Node<Vector2>() { Value = startpoint, NodeColor = Color.black };
        var end = new Node<Vector2>() { Value = endpoint, NodeColor = Color.cyan };
        var edge = new Edge<float, Vector2>() { Value = 1.0f, From = start, To = end, EdgeColor = Color.white };
    

        graph.Nodes.Add(start);
        graph.Nodes.Add(end);
        graph.Edges.Add(edge);        
    }
    */

    // Start is called before the first frame update
    void Start()
    {
        graphGen(); // MUST BE BEFORE ANYTHING ELSE
        nodeGen();
        edgeGen();
    }

    /// <summary>
    /// Callback to draw gizmos that are pickable and always drawn.
    /// </summary>
    void OnDrawGizmos()
    {
        if (graph == null) 
        {
            Start();
        }

        foreach (var node in graph.Nodes)
        {
            Gizmos.color = node.NodeColor;
            Gizmos.DrawSphere(node.Value, 0.125f);
        }

        foreach (var edge in graph.Edges)
        {
            Gizmos.color = edge.EdgeColor;
            Gizmos.DrawLine(edge.From.Value, edge.To.Value);
        }
    }
}
