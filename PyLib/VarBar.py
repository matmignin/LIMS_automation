import tkinter as tk

root = tk.Tk()
root.title("Shear and Moment Diagram Calculator")
operator=""

canvas = tk.Canvas(root, height=400, width=500, bg="White")
canvas.pack()
frame=tk.Frame(root, bg="Light Blue")
frame.place(relwidth=0.9, relheight=0.9, relx=0.05, rely=0.05)

tk.Label(frame, font=("Helvetica", 20), text="Number 1:").grid(row=0)

tk.Label(frame, font=("Helvetica", 20), text="Number 2:").grid(row=1,column=0)

# define entry variables
n1 = tk.StringVar()
n2 = tk.StringVar()

# assign the StringVar to the entry widget textvariables
num1= tk.Entry(frame, textvariable=n1)
num1.grid(row=0, column=1)
num2= tk.Entry(frame, textvariable=n2)
num2.grid(row=1, column=1)

def generate():
    # get the entered value from the entry field and convert it to float and then add
    num3 = float(n1.get()) + float(n2.get())
    print(num3)

generate=tk.Button(frame, text="result", height="2", width="10", fg="Black", bg="yellow", command=generate )
generate.grid(row=2, column=2)

root.mainloop()