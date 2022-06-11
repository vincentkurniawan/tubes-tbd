import random as r

f = open("hey.txt", "w")

vocals = ['a', 'i', 'u', 'e', 'o']
consonant = ['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z']

category = [
    
    'Romance', 'Action', 'Comedy', 'Fantasy', 'Crime',
    'Horror', 'Thriller', 'Religion', 'Biography', 'Physics',
    'Geography', 'Music', 'Sports', 'Video Game', 'Information Technology',
    'Engineering', 'Mathematics', 'Computer Science', 'Social Sciencer', 'Data Science',
    'Astrophysics', 'Chemistry', 'Climate Change', 'Electronics', 'Health',
    'Foods', 'Music', 'Politics', 'Content Creating', 'Business',
    'Conspiracy', 'Art', 'Fashion', 'Beauty', 'Psychology',
    'Japanese', 'Korean', 'Photography', 'History', 'Fanfiction',
    'Science Fiction', 'Traveling', 'Law', 'Accounting', 'Investment',
    'Movie', 'Architectural', 'Education', 'Home Living', 'Family',

]


for i in range (0, 100):
    str1 = ''
    for j in range (0, 8):
        if j%2 == 0: str1 += vocals[r.randint(0,4)]
        else: str1 += consonant[r.randint(0,20)]
    str1 += ' '
    for j in range (0, 8):
        if j%2 == 0: str1 += vocals[r.randint(0,4)]
        else: str1 += consonant[r.randint(0,20)]
    len1 = r.randint(1,4)
    str2 = category[r.randint(0,49)]
    for j in range (0, len1):
        str2 += ',' + category[r.randint(0,49)]
    # f.write("EXEC member_transaksi_keanggotaan %s, %s, '20%s0%s%s'\n" % (r.randint(1, 50), r.randint(2,3), r.randint(17,21), r.randint(1,9), r.randint(10,28)))
    f.write("EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel{}.pdf', '20{}0{}{}', '{}', {}, '{}' \n".format(i+1, r.randint(17,21), r.randint(1,9), r.randint(10,28), str1, r.randint(1,50), str2))
f.close()